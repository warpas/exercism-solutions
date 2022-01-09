# frozen_string_literal: true

# Implementation of the Difference of Squares exercise in Ruby track on Exercism.
class Squares
  # @param number [Integer]
  def initialize(number)
    @numbers = (1..number)
  end

  # @return [Integer] the squared sum of all numbers up to and including the given number
  def square_of_sum
    @numbers.sum**2
  end

  # @return [Integer] the sum of squares of all numbers up to and including the given number
  def sum_of_squares
    @numbers.reduce { |sum, i| sum + i**2 }
  end

  # @return [Integer] the difference between the squared sum and sum of squares
  def difference
    square_of_sum - sum_of_squares
  end
end
