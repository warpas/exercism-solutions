# frozen_string_literal: true

# Implementation of the All Your Base exercise in Ruby track on Exercism.
class BaseConverter
  class << self
    def convert(base_given, digits, base_expected)
      raise ArgumentError if base_given <= 1 || base_expected <= 1

      base10_number = convert_from(digits, base_given)
      reversed_digits = convert_to(base10_number, base_expected)
      reversed_digits.reverse
    end

    private

    def convert_from(digits, base)
      sum = 0
      digits.reverse.each_with_index do |digit, index|
        raise ArgumentError if digit.negative? || digit >= base

        sum += digit * (base**index)
      end
      sum
    end

    def convert_to(number, base)
      converted_digits = []
      until (number - base).negative?
        converted_digits << number % base
        number /= base
      end
      converted_digits << number
    end
  end
end
