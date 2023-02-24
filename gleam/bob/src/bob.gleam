import gleam/string
import gleam/io

pub fn hey(remark: String) -> String {
  let trimmed_remark: String = string.trim(remark)
  io.debug("Input:")
  io.debug(remark)
  io.debug(string.uppercase(remark))
  io.debug(remark == string.uppercase(remark))
  let out = case
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
  io.debug("Output:")
  io.debug(out)
}
