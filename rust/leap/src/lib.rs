pub fn is_leap_year(year: u64) -> bool {
    is_divisible_by(year, 4)
        && !is_divisible_by(year, 100)
        || is_divisible_by(year, 400)
}

fn is_divisible_by(year: u64, divisor: u64) -> bool {
    year % divisor == 0
}
