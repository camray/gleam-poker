import deck/card
import deck/deck

pub fn deal_card(deck: deck.Deck) -> Result(#(card.Card, deck.Deck), Nil) {
  case deck {
    [dealt_card, ..rest] -> Ok(#(dealt_card, rest))
    [] -> Error(Nil)
  }
}
