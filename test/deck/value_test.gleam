import deck/value.{new_value}
import gleeunit/should

pub fn create_value_test() {
  new_value(0)
  |> should.be_ok()

  new_value(13)
  |> should.be_ok()

  new_value(14)
  |> should.be_error()
}
