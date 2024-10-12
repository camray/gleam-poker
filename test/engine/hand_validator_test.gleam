import deck/card
import deck/suit
import engine/hand_validator
import gleeunit/should

pub fn is_n_pair_test() {
  let assert Ok(club_1) = card.new_card(suit.Club, 1)
  let assert Ok(club_2) = card.new_card(suit.Club, 2)
  let assert Ok(spade_2) = card.new_card(suit.Spade, 2)

  hand_validator.is_n_pair([club_1, club_2], 2)
  |> should.be_true

  hand_validator.is_n_pair([spade_2, club_2], 2)
  |> should.be_false

  hand_validator.is_n_pair([club_1, spade_2, club_2], 2)
  |> should.be_true
}

pub fn get_high_card_test() {
  let assert Ok(club_1) = card.new_card(suit.Club, 1)
  let assert Ok(spade_2) = card.new_card(suit.Spade, 2)
  let assert Ok(diamond_1) = card.new_card(suit.Diamond, 1)

  let high_card = hand_validator.get_high_card([club_1, spade_2, diamond_1])
  should.be_ok(high_card)
  should.equal(high_card, card.new_card(suit.Spade, 2))

  let high_card = hand_validator.get_high_card([])
  should.be_error(high_card)
}
