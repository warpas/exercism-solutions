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
    // 0
    let mut considered_index = 0;
    let first_color;
    // match get_an_optional_value() {
    //     Some(v) => x = v, // if Some("abc"), set x to "abc"
    //     None => panic!(), // if None, panic without any message
    // }
    println!("{:?}", color);
    match get_first() {
        Some(x) => first_color = x,
        None => panic!()
    }
    let mut all_colors = get_all();

    println!("{:?}", all_colors);
    // println!("{:?}", all_colors.next());
    // println!("{:?}", all_colors.next());
    // println!("{:?}", all_colors.next());

    let mut considered_color = all_colors.next();
    let mut are_we_there_yet: bool = false;
    let wrapped_color: Option<ResistorColor> = Some(color);
    println!("------ Loop starting");
    while !are_we_there_yet {
        are_we_there_yet = considered_color == wrapped_color;
        println!("{:?}", all_colors);
        println!("{:?}, index {:?}", considered_color, considered_index);
        println!("considered: {:?}, target: {:?}", considered_color, wrapped_color);
        println!("{:?}", are_we_there_yet);
        considered_color = all_colors.next();
        considered_index = considered_index + 1;
    }

    println!("{:?}", first_color);
    println!("{:?}", wrapped_color);
    println!("considered: {:?}, target: {:?}", considered_color, wrapped_color);
    println!("{:?}", are_we_there_yet);

    let result: u32 = considered_index - 1;
    println!("{:?}", result);

    result
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

fn get_all() -> All<ResistorColor> {
    all::<ResistorColor>()
}
