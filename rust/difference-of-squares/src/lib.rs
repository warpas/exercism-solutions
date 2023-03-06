pub fn square_of_sum(n: u32) -> u32 {
    let sum: u32 = vector_from_1_to(n)
        .sum();
    sum * sum
}

pub fn sum_of_squares(n: u32) -> u32 {
    vector_from_1_to(n)
        .map(|v| v * v)
        .sum()
}

fn vector_from_1_to(n: u32) -> std::ops::Range<u32> {
    1..n+1
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
