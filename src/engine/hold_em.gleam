import engine/dealer
import gleam/list
import gleam/result
import deck/deck.{type Deck}
import engine/player
import gleam/int

pub type GameState {
  GameState(players: List(player.Player), deck: Deck)
}

pub fn init_game(player_count: Int) -> Result(GameState, Nil) {
  use game_deck <- result.map(deck.new_deck())
  let players = create_player_list(player_count, [])
  GameState(players, game_deck)
}

fn create_player_list(player_count: Int, players: List(player.Player)) -> List(player.Player) {
  case player_count {
    0 -> players
    _ -> {
      let new_player = player.Player(int.to_string(player_count), [])
      create_player_list(player_count - 1, [new_player, ..players])
    }
  }
}

/// Deal two cards to each player in turn
pub fn deal_hand(game_state: GameState) {
  let cards = game_state.deck

  todo

  // game_state.players
  // |> list.map(fn (player) {
  //   let new_cards = player.cards
  //   case dealer.deal_card(cards) {
  //     Ok(#(card, new_deck)) -> {
  //       let new_cards = [card, ..player.cards]

  //       Nil
  //     }
  //     Error(_) -> Nil
  //   }
  // })
}