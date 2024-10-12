import deck/deck
import engine/hand_validator
import gleam/io

pub fn main() {
  case deck.new_deck() {
    Ok(d) -> {
      io.debug(hand_validator.is_two_pair(d))
      Nil
    }
    Error(_) -> {
      Nil
    }
  }
}
