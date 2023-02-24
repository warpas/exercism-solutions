import gleam/string.{ends_with, lowercase, trim, uppercase}

pub fn hey(remark: String) -> String {
  case is_silence(remark), is_shouting(remark), is_question(remark) {
    True, _, _ -> "Fine. Be that way!"
    _, True, True -> "Calm down, I know what I'm doing!"
    _, _, True -> "Sure."
    _, True, _ -> "Whoa, chill out!"
    _, _, _ -> "Whatever."
  }
}

fn is_silence(remark: String) -> Bool {
  trim(remark) == ""
}

fn is_shouting(remark: String) -> Bool {
  remark == uppercase(remark) && remark != lowercase(remark)
}

fn is_question(remark: String) -> Bool {
  remark
  |> trim()
  |> ends_with("?")
}
