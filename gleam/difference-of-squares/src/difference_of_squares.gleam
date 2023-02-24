import gleam/io
import gleam/list

pub fn square_of_sum(n: Int) -> Int {
  let sum_of_list: Int =
    n
    |> list_of_1_to_n([])
    |> list.fold_right(0, fn(a, b) { a + b })
  sum_of_list * sum_of_list
}

fn list_of_1_to_n(n: Int, list: List(Int)) -> List(Int) {
  case n {
    0 -> list
    _ -> list_of_1_to_n(n - 1, [n, ..list])
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  todo("Implement this function")
}

pub fn difference(n: Int) -> Int {
  todo("Implement this function")
}
