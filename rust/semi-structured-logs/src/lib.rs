// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

/// various log levels
#[derive(Clone, PartialEq, Eq, Debug)]
pub enum LogLevel {
    Info,
    Warning,
    Error,
}
/// primary function for emitting logs
pub fn log(level: LogLevel, message: &str) -> String {
    let levelsLevels = level as str;
    format!("[{}]: Timezone changed", levelsLevels)
    // TODO: use the level variable
    // TODO: use the message variable
    // String::from("[INFO]: Timezone changed")
}
// fn main() {
//     let a = "AAA";
//     let b = format!("BBB {}", a);
//     println(b);
// }
// output: BBB AAA
pub fn info(message: &str) -> String {
    // TODO: use the message variable
    String::from("[INFO]: Timezone changed")
}
pub fn warn(message: &str) -> String {
    // TODO: use the message variable
    String::from("[WARNING]: Timezone not set")
}
pub fn error(message: &str) -> String {
    // TODO: use the message variable
    String::from("[ERROR]: Disk full")
}
