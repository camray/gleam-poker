import deck/card
import deck/suit
import engine/hand_validator
import gleeunit/should

pub fn is_two_pair_test() {
  let assert Ok(club_1) = card.new_card(suit.Club, 1)
  let assert Ok(club_2) = card.new_card(suit.Club, 2)
  let assert Ok(spade_2) = card.new_card(suit.Spade, 2)

  hand_validator.is_two_pair([club_1, club_2])
  |> should.be_true

  hand_validator.is_two_pair([spade_2, club_2])
  |> should.be_false

  hand_validator.is_two_pair([club_1, spade_2, club_2])
  |> should.be_true
}
