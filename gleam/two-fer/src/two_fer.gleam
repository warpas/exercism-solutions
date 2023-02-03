import gleam/option.{Option}

pub fn two_fer(name: Option(String)) -> String {
  let results = option.to_result(name, "missing")
  let name_string = case results {
    Ok(actually_a_name) -> actually_a_name
    Error("missing") -> "you"
  }
  "One for " <> name_string <> ", one for me."
}
