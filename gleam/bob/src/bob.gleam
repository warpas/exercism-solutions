import gleam/string

pub fn hey(remark: String) -> String {
  let trimmed_remark: String = string.trim(remark)
  case
    trimmed_remark,
    remark == string.uppercase(remark),
    remark == string.lowercase(remark),
    string.ends_with(trimmed_remark, "?")
  {
    "", _, _, _ -> "Fine. Be that way!"
    _, True, False, True -> "Calm down, I know what I'm doing!"
    _, _, _, True -> "Sure."
    _, True, False, _ -> "Whoa, chill out!"
    _, _, _, _ -> "Whatever."
  }
}
