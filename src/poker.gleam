import deck/deck
import engine/hand_validator
import gleam/erlang
import gleam/io
import gleam/result

pub fn main() {
  io.println("Playing a game of Texas Hold 'Em Poker")
  use game_deck <- result.map(deck.new_deck())

  case erlang.get_line("Say something nice\n") {
    Ok(res) -> {
      io.debug(res)
      Nil
    }
    Error(_) -> Nil
  }

  io.debug(game_deck)
}
