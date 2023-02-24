import gleam/list

pub fn square_of_sum(n: Int) -> Int {
  let sum_of_list: Int =
    n
    |> list_of_1_to_n([])
    |> list.fold_right(0, fn(a, b) { a + b })
  sum_of_list * sum_of_list
}

pub fn sum_of_squares(n: Int) -> Int {
  n
  |> list_of_1_to_n([])
  |> list.fold_right(0, fn(a, b) { a + b * b })
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}

fn list_of_1_to_n(n: Int, list: List(Int)) -> List(Int) {
  case n {
    0 -> list
    _ -> list_of_1_to_n(n - 1, [n, ..list])
  }
}
