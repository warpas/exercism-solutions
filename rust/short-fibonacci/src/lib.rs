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
    let count = 3;
    let mut fib_vector = vec![1u8, 1];
    for i in 0..count {
        fib_vector.push(fib_vector[i] + fib_vector[i+1]);
    }
    fib_vector
}
