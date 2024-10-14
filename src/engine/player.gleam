import deck/card.{type Card}

pub type Player {
  Player(name: String, cards: List(Card))
}