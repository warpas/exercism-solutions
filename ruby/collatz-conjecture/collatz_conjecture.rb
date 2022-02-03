# frozen_string_literal: true

# Implementation of the Collatz Conjecture exercise in Ruby track on Exercism.
class CollatzConjecture
  # @param number [Integer]
  # @return [Integer]
  def self.steps(number)
    raise ArgumentError if number < 1

    total_steps = 0
    while number != 1
      number = number.even? ? (number / 2) : (number * 3 + 1)
      total_steps += 1
    end

    total_steps
  end
end
