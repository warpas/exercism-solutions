pub fn is_leap_year(year: Int) -> Bool {
  case year % 4 {
    0 ->
      case year % 100 {
        0 ->
          case year % 400 {
            0 -> True
            _ -> False
          }
        _ -> True
      }
    _ -> False
  }
}
