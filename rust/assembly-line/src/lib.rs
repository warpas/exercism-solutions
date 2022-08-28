// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

pub fn production_rate_per_hour(speed: u8) -> f64 {
    let success_rate: f64 = if speed < 5 {
        1.0
    } else {
        0.9
    };
    let speed_float: f64 = <u8 as Into<f64>>::into(speed);
    let production_rate: f64 = 221.0;
    speed_float * production_rate * success_rate
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    unimplemented!("calculate the amount of working items at speed: {}", speed)
}
