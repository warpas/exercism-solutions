// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

pub fn divmod(dividend: i16, divisor: i16) -> (i16, i16) {
    let result = dividend / divisor;
    let remainder = dividend % divisor;
    (result, remainder)
}

pub fn evens<T>(iter: impl Iterator<Item = i32>) -> impl Iterator<Item = i32> {
    let array = [0i32, 2, 4, 6];
    // let iterator = std::iter::empty();
    let iterator = array.iter();

    // vec![0, 2, 4, 6]: Iterator<i32>
    //     let out: Vec<i32> = evens(0..).take(5).collect();
    //     assert_eq!(out, &[0, 2, 4, 6, 8]);
    // &[0, 2, 4, 6, 8].iter()
    iterator
}

pub struct Position(pub i16, pub i16);
impl Position {
    pub fn manhattan(&self) -> i16 {
        unimplemented!("implement `fn manhattan`")
    }
}
