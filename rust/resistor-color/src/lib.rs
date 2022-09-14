use enum_iterator::{all, cardinality, first, last, next, previous, Sequence};
#[derive(Debug, PartialEq, Eq, Sequence)]
pub enum ResistorColor {
    Black,
    Blue,
    Brown,
    Green,
    Grey,
    Orange,
    Red,
    Violet,
    White,
    Yellow,
}

pub fn color_to_value(_color: ResistorColor) -> u32 {
    // 0
    let first_color;
    // match get_an_optional_value() {
    //     Some(v) => x = v, // if Some("abc"), set x to "abc"
    //     None => panic!(), // if None, panic without any message
    // }
    match get_first() {
        Some(x) => first_color = x,
        None => panic!()
    }

    println!("{:?}", _color);
    println!("{:?}", first_color);

    0
}

pub fn value_to_color_string(value: u32) -> String {
    unimplemented!(
        "convert the value {} into a string representation of color",
        value
    )
}

pub fn colors() -> Vec<ResistorColor> {
    unimplemented!("return a list of all the colors ordered by resistance")
}

fn get_first() -> Option<ResistorColor> {
    first::<ResistorColor>()
}
