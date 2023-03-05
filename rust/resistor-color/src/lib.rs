use enum_iterator::{all, cardinality, first, last, next, previous, Sequence, All};
#[derive(Debug, PartialEq, Eq, Sequence)]
pub enum ResistorColor {
    Black,
    Brown,
    Red,
    Orange,
    Yellow,
    Green,
    Blue,
    Violet,
    Grey,
    White,
}

use int_enum::IntEnum;

#[repr(u32)]
#[derive(Clone, Copy, IntEnum)]
// #[derive(Clone, Copy, Debug, Eq, PartialEq, IntEnum)]
pub enum ResistorColorNew {
    Black = 0,
    Brown = 1,
    Red = 2,
    Orange = 3,
    Yellow = 4,
    Green = 5,
    Blue = 6,
    Violet = 7,
    Grey = 8,
    White = 9,
}

pub fn color_to_value_new(color: ResistorColorNew) -> u32 {
    // let wrapped_color: Option<ResistorColor> = Some(color);
    // let mut all_colors = get_all();
    // let mut considered_color = all_colors.next();
    // let mut considered_index = 0;

    // while considered_color != wrapped_color {
    //     considered_index = considered_index + 1;
    //     considered_color = all_colors.next();
    // }

    // considered_index

    // ^^^ OLD IMPLEMENTATION
    color.int_value()
}

pub fn color_to_value(color: ResistorColor) -> u32 {
    0
}

pub fn value_to_color_string(value: u32) -> String {
    let mut considered_index = 0;
    let mut all_colors = get_all();
    let mut considered_color = all_colors.next();

    while considered_index < value {
        considered_index = considered_index + 1;
        considered_color = all_colors.next();
    }
    let unwrapped_color: ResistorColor;
    match considered_color {
        Some(x) => unwrapped_color = x,
        None => return String::from("value out of range")
    }

    let result: String = format!("{:?}", unwrapped_color);
    result
    // ^^^ OLD IMPLEMENTATION

    // let unwrapped_color = "Result";
    // format!("{:?}", unwrapped_color);
}

pub fn colors() -> Vec<ResistorColor> {
    let mut vector : Vec<ResistorColor> = Vec::new();
    let mut all_colors = get_all();
    while true {
        let considered_color = all_colors.next();
        let unwrapped_color: ResistorColor;
        match considered_color {
            Some(x) => unwrapped_color = x,
            None => return vector
        }
        vector.push(unwrapped_color);
    }
    vector
    // ^^^ OLD IMPLEMENTATION
}

fn get_all() -> All<ResistorColor> {
    all::<ResistorColor>()
}
