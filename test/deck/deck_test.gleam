import gleam/result
import gleam/list
import gleeunit/should
import deck/deck

pub fn create_value_test() {
  deck.new_deck()
  |> result.unwrap([])
  |> list.length()
  |> should.equal(52)
}
