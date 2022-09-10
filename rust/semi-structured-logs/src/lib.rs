// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

// use log::Level;
// use log::info;

/// various log levels
#[derive(Clone, PartialEq, Eq, Debug)]
pub enum LogLevel {
    Info,
    Warning,
    Error,
}
/// primary function for emitting logs
pub fn log(level: LogLevel, message: &str) -> String {
    // let levelsLevels = level.to_string();
    // format!("[{}]: Timezone changed", levelsLevels)

    println!("!!!!!!!!! start");
    // println()
    // if level ==
    println!("{}", message);

    // let success_rate: f64 = if speed < 5 {
    //     1.0
    // } else if speed < 9 {
    //     0.9
    // } else {
    //     0.77
    // };
    if level == LogLevel::Warning {
        println!("LogLevel::Warning");
        return String::from("[WARNING]: Timezone not set")
    }
    if level == LogLevel::Error {
        println!("LogLevel::Error")
    }
    if level == LogLevel::Info {
        println!("LogLevel::Info")
    }
    // println!("{}", level);
    // `LogLevel` cannot be formatted with the default formatter. What do?

    // TODO: use the level variable
    // TODO: use the message variable
    println!("!!!!!!!!! end");
    return String::from("[INFO]: Timezone changed");
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
