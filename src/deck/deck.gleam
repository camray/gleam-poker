import gleam/result
import gleam/list
import deck/card.{type Card}
import deck/suit

pub type Deck = List(Card)

pub fn new_deck() -> Result(Deck, Nil) {
  let all_suits = suit.all_suits
  let all_values = list.range(1, 13)

  let cards = list.flat_map(all_suits, fn (s) {
    list.map(all_values, fn (v) {
      card.new_card(s, v)
    })
  })

  let validated_list = list.fold(cards, Ok([]), fn (acc, card) -> Result(List(Card), Nil) {
    case acc {
      Ok(acc) -> case card {
        Ok(card) -> Ok([card, ..acc])
        Error(_) -> Error(Nil)
      }
      Error(_) -> Error(Nil)
    }
  })

  use x <- result.map(validated_list)
  list.shuffle(x)
}
