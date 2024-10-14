import engine/hold_em
import gleam/io
import gleam/result

pub fn main() {
  io.println("Playing a game of Texas Hold 'Em Poker")
  use game_state <- result.map(hold_em.init_game(2))

  io.debug(game_state)
}
