// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

pub fn production_rate_per_hour(speed: u8) -> f64 {
    let success_rate: f64 = if speed < 5 {
        1.0
    } else if speed < 9 {
        0.9
    } else {
        0.77
    };
    let speed_float: f64 = <u8 as Into<f64>>::into(speed);
    let production_rate: f64 = 221.0;
    speed_float * production_rate * success_rate
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    let speed_u32: u32 = speed.into();
    let production_rate_per_hour: u32 = (221 / 60);
    production_rate_per_hour * speed_u32
}
