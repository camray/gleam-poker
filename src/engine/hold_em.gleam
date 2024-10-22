import deck/deck.{type Deck}
import engine/player
import gleam/result

pub type GameState {
  GameState(players: List(player.Player), deck: Deck)
}

pub fn init_game(player_count: Int) -> Result(GameState, Nil) {
  use game_deck <- result.map(deck.new_deck())
  let players = create_player_list(player_count, [])
  GameState(players, game_deck)
}

fn create_player_list(
  player_count: Int,
  players: List(player.Player),
) -> List(player.Player) {
  case player_count {
    0 -> players
    _ -> {
      let new_player = player.Player([])
      create_player_list(player_count - 1, [new_player, ..players])
    }
  }
}
