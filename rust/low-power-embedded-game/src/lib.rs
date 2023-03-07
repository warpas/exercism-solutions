// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]
// #[derive(Debug)]

pub fn divmod(dividend: i16, divisor: i16) -> (i16, i16) {
    let result = dividend / divisor;
    let remainder = dividend % divisor;
    (result, remainder)
}

pub fn simple_evens(iter: impl Iterator) -> impl Iterator {
// pub fn evens<usize>(iter: impl Iterator<usize>) -> impl Iterator<usize> {
    // println!("{:#?}", iter)
    // println!("{:#?}", iter.enumerate())
    iter
}

// pub fn evens<usize>(iter: impl Iterator<Item = usize> + std::fmt::Debug) -> impl Iterator<Item = usize> {
pub fn evens<T>(iter: impl Iterator<Item = T>) -> impl Iterator<Item = T> {

    // println!("{:}", iter);
    // for i in iter {
    //     println!("{:?}", i);
    // }
    // let array = [0i32, 2, 4, 6];
    // let iterator = std::iter::empty();
    // let my_iterator = array.iter();

    // vec![0, 2, 4, 6]: Iterator<i32>
    //     let out: Vec<i32> = evens(0..).take(5).collect();
    //     assert_eq!(out, &[0, 2, 4, 6, 8]);
    // &[0, 2, 4, 6, 8].iter()
    // my_iterator
    // iter.push(0i32);
    // iter
    // unimplemented!("implement `fn evens`");
    // // TODO: remove this; it's only necessary to allow this function to compile
    // // before the student has done any work.
    // std::iter::empty()
    // (0..)
    // iter.map(|n| n * n)
    // Enumerate::<i, val> = iter.enumerate();
    // println!("{:?}", iter.enumerate());

    // let new_iter = iter.enumerate();
    // println!("{:?}", iter.inspect());
    // let new_iter = iter.enumerate().filter(|(i, n)| i % 2 == 0);
    // println!("{:?}", new_iter.inspect());
    iter


    // let v_test1: Vec<T> = vec![0, 2, 4, 6, 8];
    // v_test1.iter()
}

pub struct Position(pub i16, pub i16);
impl Position {
    pub fn manhattan(&self) -> i16 {
        unimplemented!("implement `fn manhattan`")
    }
}
