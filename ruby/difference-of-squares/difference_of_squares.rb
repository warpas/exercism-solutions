# frozen_string_literal: true

# Implementation of the Difference of Squares exercise in Ruby track on Exercism.
class Squares
  # @param number [Integer]
  def initialize(number)
    @number = number
  end

  # @return [Integer] the squared sum of all numbers up to and including the given number
  def square_of_sum
    sum = (1..@number).sum
    sum * sum
  end

  # @return [Integer] the sum of squares of all numbers up to and including the given number
  def sum_of_squares
    (1..@number).map { |i| i * i }.sum
  end

  # @return [Integer] the difference between the squared sum and sum of squares
  def difference
    square_of_sum - sum_of_squares
  end
end
