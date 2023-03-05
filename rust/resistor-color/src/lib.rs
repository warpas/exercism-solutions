use int_enum::IntEnum;

#[repr(u32)]
// #[derive(Clone, Copy, IntEnum)]
#[derive(Clone, Copy, Debug, Eq, PartialEq, IntEnum)]
pub enum ResistorColor {
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

pub fn color_to_value(color: ResistorColor) -> u32 {
    color.int_value()
}

pub fn value_to_color_string(value: u32) -> String {
    match ResistorColor::from_int(value) {
        Ok(unwrapped_color) => format!("{:?}", unwrapped_color),
        Err(_) => String::from("value out of range")
    }
}

pub fn colors() -> Vec<ResistorColor> {
    let vector : Vec<ResistorColor> = Vec::new();
    // let mut all_colors = get_all();
    // while true {
    //     let considered_color = all_colors.next();
    //     let unwrapped_color: ResistorColor;
    //     match considered_color {
    //         Some(x) => unwrapped_color = x,
    //         None => return vector
    //     }
    //     vector.push(unwrapped_color);
    // }
    vector
    // ^^^ OLD IMPLEMENTATION
}

// fn get_all() -> All<ResistorColor> {
//     all::<ResistorColor>()
// }
