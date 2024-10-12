import deck/suit.{type Suit}
import deck/value.{type Value}
import gleam/result

pub opaque type Card {
  Card(suit: Suit, value: Value)
}

pub fn new_card(suit: Suit, value: Int) {
  use v <- result.map(value.new_value(value))
  Card(suit, v)
}

pub fn get_suit(card: Card) {
  card.suit
}

pub fn get_value(card: Card) {
  card.value
}
