class Squares {
  var number: Int
  var sumOfSquares: Int
  var squareOfSum: Int
  var differenceOfSquares: Int

  init(_ number: Int) {
    self.number = number

    // print("\n number: \(number)")
    var sum: Int = 0
    for index in 1...self.number {
      // print("\n index: \(index)")
      sum = sum + index
    }
    // print("\n sum: \(sum)")

    // return sum * sum

    self.sumOfSquares = 1
    self.squareOfSum = sum * sum
    self.differenceOfSquares = 1
  }
}
