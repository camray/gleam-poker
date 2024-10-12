import gleam/io
import gleam/result
import deck/deck

pub fn main() {
  io.println("Hello from poker!")
  result.map(deck.new_deck(), fn (res) {
    io.debug(res)
  })
}
