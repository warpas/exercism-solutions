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

pub fn color_to_value(color: ResistorColor) -> u32 {
    let wrapped_color: Option<ResistorColor> = Some(color);
    let mut all_colors = get_all();
    let mut considered_color = all_colors.next();
    let mut considered_index = 0;
    while considered_color != wrapped_color {
        considered_index = considered_index + 1;
        considered_color = all_colors.next();
    }

    considered_index
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

fn get_all() -> All<ResistorColor> {
    all::<ResistorColor>()
}
