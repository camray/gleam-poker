import deck/deck
import engine/hand_validator
import gleam/io

pub fn main() {
  case deck.new_deck() {
    Ok(d) -> {
      io.debug(hand_validator.is_n_pair(d, 2))
      Nil
    }
    Error(_) -> {
      Nil
    }
  }
}
