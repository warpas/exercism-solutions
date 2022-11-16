/// Create an empty vector
pub fn create_empty() -> Vec<u8> {
    Vec::new()
}

/// Create a buffer of `count` zeroes.
///
/// Applications often use buffers when serializing data to send over the network.
pub fn create_buffer(count: usize) -> Vec<u8> {
    let mut vector = vec![];
    for _i in 0..count {
        vector.push(0u8);
    }
    vector
}

/// Create a vector containing the first five elements of the Fibonacci sequence.
///
/// Fibonacci's sequence is the list of numbers where the next number is a sum of the previous two.
/// Its first five elements are `1, 1, 2, 3, 5`.
pub fn fibonacci() -> Vec<u8> {
    // let mut fib_vector = create_buffer(5);
    let count = 5;
    let mut fib_vector = vec![1u8];
    for _i in 0..count {
        fib_vector.push(1u8);
    }
    // fib_vector
    // println!("Initial vector: {:?}", my_vector);
    // let mut i = 0;
    // while i < count {
    //     my_vector.push(0u8);
    //     i += 1;
    //     println!("Iterator: {:?}", i);
    // }

    // my_vector.push(1);
    // println!("Updated vector: {:?}", my_vector);
    fib_vector
}
