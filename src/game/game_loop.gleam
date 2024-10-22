import engine/dealer
import engine/hold_em
import game/io_helpers
import gleam/io
import gleam/result

pub fn game_init() {
  let instructions: io_helpers.Inputs = [#("s", "Start Game"), #("h", "Help")]

  let in = io_helpers.read_input(instructions)

  case in {
    Ok("s") -> {
      io.println("Starting Game!")
      deal()
    }
    _ -> game_init()
  }
}

fn get_players_count() -> Int {
  let count = io_helpers.read_input_int("How many players?")
  case count < 11 {
    True -> count
    False -> io_helpers.read_input_int("Must be less than 10 players")
  }
}

fn deal() {
  let player_count = get_players_count()
  io.debug(player_count)

  use game <- result.map(hold_em.init_game(player_count))

  let #(players, deck) =
    dealer.deal_n_cards_to_players(2, game.players, game.deck)

  io.println("Players")
  io.debug(players)
  io.println("Deck")
  io.debug(deck)

  Nil
}
