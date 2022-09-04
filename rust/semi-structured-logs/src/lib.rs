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
    unimplemented!("return a message for the given log level")
}
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
