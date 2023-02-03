import gleam/option.{Option}

pub fn two_fer(name: Option(String)) -> String {
  let name_string = option.unwrap(name, "you")
  "One for " <> name_string <> ", one for me."
}
