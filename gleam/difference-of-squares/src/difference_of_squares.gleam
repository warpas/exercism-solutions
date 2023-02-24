import gleam/io
import gleam/list

pub fn square_of_sum(n: Int) -> Int {
  let my_list: List(Int) = list_of_1_to_n(n)
  let sum_of_list: Int =
    my_list
    |> list.fold_right(0, fn(a, b) { a + b })
  io.debug(my_list)
  io.debug(sum_of_list)
  sum_of_list * sum_of_list
}

fn list_of_1_to_n(n: Int) -> List(Int) {
  constructing_list(n, [])
}

fn constructing_list(n: Int, list: List(Int)) -> List(Int) {
  case n {
    0 -> list
    _ -> constructing_list(n - 1, [n, ..list])
  }
}

pub fn sum_of_squares(n: Int) -> Int {
  todo("Implement this function")
}

pub fn difference(n: Int) -> Int {
  todo("Implement this function")
}
