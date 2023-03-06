pub fn square_of_sum(n: u32) -> u32 {
    let sum_1_to_n: u32 = (1..n+1).sum();
    sum_1_to_n * sum_1_to_n
}

pub fn sum_of_squares(n: u32) -> u32 {
    (1..n+1)
        .map(|v| v * v)
        .sum()
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
