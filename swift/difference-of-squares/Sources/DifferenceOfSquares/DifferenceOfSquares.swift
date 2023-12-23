class Squares {
  let sumOfSquares: Int
  let squareOfSum: Int
  let differenceOfSquares: Int

  init(_ number: Int) {
    var sum: Int = 0
    var sumOfSquares: Int = 0
    for index in 1...number {
      sum += index
      sumOfSquares += index * index
    }

    self.squareOfSum = sum * sum
    self.sumOfSquares = sumOfSquares
    self.differenceOfSquares = self.squareOfSum - self.sumOfSquares
  }
}
