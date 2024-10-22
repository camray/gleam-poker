import gleam/erlang
import gleam/int
import gleam/string

type Input =
  #(String, String)

type Inputs =
  List(Input)

pub fn inputs_to_string(ins: Inputs) -> String {
  case ins {
    [] -> ""
    [#(char, instruction), ..rest] ->
      char <> ": " <> instruction <> "\n" <> inputs_to_string(rest)
  }
}

pub fn read_input(inputs: Inputs) -> Result(String, Nil) {
  case erlang.get_line(inputs_to_string(inputs)) {
    Ok(s) -> {
      s
      |> string.trim
      |> string.lowercase
      |> match_inputs(inputs)
    }
    Error(_) -> read_input(inputs)
  }
}

fn match_inputs(val_to_test: String, inputs: Inputs) -> Result(String, Nil) {
  case inputs {
    [] -> Error(Nil)
    [#(str, _), ..rest] -> {
      case val_to_test == str {
        True -> Ok(str)
        False -> match_inputs(val_to_test, rest)
      }
    }
  }
}

pub fn read_input_int(instructions: String) -> Int {
  case erlang.get_line(instructions <> "\n") {
    Ok(s) -> {
      let res =
        s
        |> string.trim
        |> int.parse
      case res {
        Ok(num) -> num
        Error(_) -> read_input_int(instructions)
      }
    }
    Error(_) -> read_input_int(instructions)
  }
}
