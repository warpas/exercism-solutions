# frozen_string_literal: true

# Implementation of the Luhn exercise in Ruby track on Exercism.
class Luhn
  # @param arg [String] identification number to be validated
  # @return [Boolean] is it valid by the standards of the Luhn algorithm?
  def self.valid?(arg)
    new(arg).valid?
  end

  # @param string [String]
  def initialize(string)
    @string = string.strip
  end

  # @return [Boolean] is it valid by the standards of the Luhn algorithm?
  def valid?
    return false if @string.length < 2
    return false unless valid_chars_only?

    (sum_up_luhn % 10).zero?
  end

  private

  def sum_up_luhn
    every_other_starting_at0 = []
    every_other_starting_at1 = []
    @string.reverse.chars do |digit|
      next if digit == ' '

      if every_other_starting_at0.length > every_other_starting_at1.length
        every_other_starting_at1 << double_luhn(digit)
      else
        every_other_starting_at0 << digit.to_i
      end
    end

    every_other_starting_at0.sum + every_other_starting_at1.sum
  end

  def valid_chars_only?
    @string.scan(/\D/).reject { |nondigit| nondigit == ' ' }.empty?
  end

  def double_luhn(number)
    double = number.to_i * 2

    double > 9 ? double - 9 : double
  end
end
