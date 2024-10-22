import deck/card
import deck/deck
import engine/player
import gleam/result

pub fn deal_card(deck: deck.Deck) -> Result(#(card.Card, deck.Deck), Nil) {
  case deck {
    [dealt_card, ..rest] -> Ok(#(dealt_card, rest))
    [] -> Error(Nil)
  }
}

pub fn deal_card_to_players(
  players: List(player.Player),
  deck: deck.Deck,
) -> #(List(player.Player), deck.Deck) {
  case players {
    [] -> #([], deck)
    [p, ..rest] -> {
      let #(new_players, new_deck) = deal_card_to_players(rest, deck)
      case deal_card(new_deck) {
        Error(_) -> #([p, ..new_players], new_deck)
        Ok(#(card, new_deck)) -> {
          let new_player = player.Player(cards: [card, ..p.cards])
          #([new_player, ..new_players], new_deck)
        }
      }
    }
  }
}

pub fn deal_n_cards_to_players(
  n: Int,
  players: List(player.Player),
  deck: deck.Deck,
) -> #(List(player.Player), List(card.Card)) {
  case n {
    0 -> #(players, deck)
    _ -> {
      let #(new_players, new_deck) =
        deal_n_cards_to_players(n - 1, players, deck)
      deal_card_to_players(new_players, new_deck)
    }
  }
}
