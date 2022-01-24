# frozen_string_literal: true

# Implementation of the Armstrong Numbers exercise in Ruby track on Exercism.
class ArmstrongNumbers
  # @param number [Integer]
  # @return [Boolean] does the number meet the criteria to be an Armstrong number?
  def self.include?(number)
    digits = number.digits
    number == digits.reduce(0) { |res, x| res + x**digits.length }
  end
end
