pub opaque type Value {
  Value(val: Int)
}

pub fn new_value(val: Int) -> Result(Value, Nil) {
  case val <= 13 {
    True -> Ok(Value(val))
    False -> Error(Nil)
  }
}
