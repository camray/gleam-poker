pub type Suit {
  Heart
  Diamond
  Spade
  Club
}

pub const all_suits: List(Suit) = [Heart, Diamond, Spade, Club]

pub fn to_int(s: Suit) -> Int {
  case s {
    Heart -> 0
    Diamond -> 1
    Spade -> 2
    Club -> 3
  }
}
