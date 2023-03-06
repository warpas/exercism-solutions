pub fn square_of_sum(n: u32) -> u32 {
    let sum: u32 = vector_from_1_to(n)
        .iter()
        .sum();
    sum * sum
}

pub fn sum_of_squares(n: u32) -> u32 {
    vector_from_1_to(n)
        .iter()
        .map(|v| v * v)
        .sum()
}

fn vector_from_1_to(n: u32) -> Vec<u32> {
    let mut from_1_to_n: Vec<u32> = vec![];
    for i in 0..n {
        from_1_to_n.push(i + 1)
    }
    from_1_to_n
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}
