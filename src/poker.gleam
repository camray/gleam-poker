import game/game_loop
import gleam/io

pub fn main() {
  io.println("Playing a game of Texas Hold 'Em Poker")

  game_loop.game_init()
}
