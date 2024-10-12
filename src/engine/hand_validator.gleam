import deck/card.{get_suit}
import deck/suit.{suit_to_int}
import gleam/list
import gleam/order

pub fn is_two_pair(cards: List(card.Card)) -> Bool {
  cards
  |> sort_by_suit
  |> split_consecutive_items
  |> list.any(fn(cards) { list.length(cards) > 1 })
}

pub fn sort_by_suit(cards: List(card.Card)) {
  list.sort(cards, fn(a, b) {
    case suit_to_int(get_suit(a)) > suit_to_int(get_suit(b)) {
      True -> order.Gt
      False -> order.Lt
    }
  })
}

pub fn split_consecutive_items(cards: List(card.Card)) {
  list.fold(cards, [], fn(acc, card) {
    case acc {
      [] -> [[card]]
      [current_group, ..rest] -> {
        case list.last(current_group) {
          Ok(c) -> {
            case get_suit(c) == get_suit(card) {
              True -> [[card, ..current_group], ..rest]
              False -> [[card], current_group, ..rest]
            }
          }
          Error(_) -> []
        }
      }
    }
  })
}
