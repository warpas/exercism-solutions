// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

pub fn production_rate_per_hour(speed: u8) -> f64 {
    // <u8 as Into<f64>>::into(221 * speed) //* 0.2
    <u8 as Into<f64>>::into(speed) * 221.0
    // (speed).into() * 221.0
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    unimplemented!("calculate the amount of working items at speed: {}", speed)
}
