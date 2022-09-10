// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

/// various log levels
#[derive(Clone, PartialEq, Eq, Debug)]
pub enum LogLevel {
    Info,
    Warning,
    Error,
    Debug,
}
/// primary function for emitting logs
pub fn log(level: LogLevel, message: &str) -> String {
    println!("!!!!!!!!! start");
    println!("{}", message);

    if level == LogLevel::Warning {
        println!("LogLevel::Warning");
        return warn(message)
    }
    if level == LogLevel::Error {
        println!("LogLevel::Error");
        return error(message)
    }
    if level == LogLevel::Info {
        println!("LogLevel::Info");
        return info(message)
    }

    println!("!!!!!!!!! end");
    return String::from("[INFO]: Timezone changed");
}

pub fn info(message: &str) -> String {
    format!("[INFO]: {}", message)
}
pub fn warn(message: &str) -> String {
    format!("[WARNING]: {}", message)
}
pub fn error(message: &str) -> String {
    format!("[ERROR]: {}", message)
}
