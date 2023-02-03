import gleam/option.{Option, unwrap}

pub fn two_fer(name: Option(String)) -> String {
  let name_string = unwrap(name, "you")
  "One for " <> name_string <> ", one for me."
}
