pub fn square_of_sum(n: u32) -> u32 {
    let mut from_1_to_n: Vec<u32> = vec![];
    for i in 0..n {
        from_1_to_n.push(i + 1)
    }
    let sum: u32 = from_1_to_n.iter().sum();
    sum * sum
}

pub fn sum_of_squares(n: u32) -> u32 {
    let mut from_1_to_n: Vec<u32> = vec![];
    for i in 0..n {
        from_1_to_n.push(i + 1)
    }
    let sum: u32 = from_1_to_n.iter().map(|v| v * v).sum();
    sum
}

pub fn difference(n: u32) -> u32 {
    unimplemented!("difference between square of sum of 1...{n} and sum of squares of 1...{n}")
}
