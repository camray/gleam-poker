import gleam/result
import deck/suit.{type Suit}
import deck/value.{type Value}

pub opaque type Card {
  Card(suit: Suit, value: Value)
}

pub fn new_card(suit: Suit, value: Int) {
  use v <- result.map(value.new_value(value))
  Card(suit, v)
}
