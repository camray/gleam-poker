import deck/deck
import gleam/list
import gleam/result
import gleeunit/should

pub fn create_value_test() {
  deck.new_deck()
  |> result.unwrap([])
  |> list.length()
  |> should.equal(52)
}
