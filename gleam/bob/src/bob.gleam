import gleam/string

pub fn hey(remark: String) -> String {
  let trimmed_remark: String = string.trim(remark)
  case
    silence(trimmed_remark),
    shouting(trimmed_remark),
    question(trimmed_remark)
  {
    True, _, _ -> "Fine. Be that way!"
    _, True, True -> "Calm down, I know what I'm doing!"
    _, _, True -> "Sure."
    _, True, _ -> "Whoa, chill out!"
    _, _, _ -> "Whatever."
  }
}

fn silence(remark: String) -> Bool {
  remark == ""
}

fn shouting(remark: String) -> Bool {
  remark == string.uppercase(remark) && remark != string.lowercase(remark)
}

fn question(remark: String) -> Bool {
  string.ends_with(remark, "?")
}
