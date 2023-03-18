pub fn square_of_sum(n: u32) -> u32 {
    sum_1_to(n).pow(2)
}

pub fn sum_of_squares(n: u32) -> u32 {
    (sum_1_to(n) * ((n * 2) + 1)) / 3
}

fn sum_1_to(n: u32) -> u32 {
    (n * (n + 1)) / 2
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
