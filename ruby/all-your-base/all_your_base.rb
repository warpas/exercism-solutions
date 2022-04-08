# frozen_string_literal: true

# Implementation of the All Your Base exercise in Ruby track on Exercism.
class BaseConverter
  class << self
    def convert(base_given, digits, base_expected)
      raise ArgumentError if base_given <= 1 || base_expected <= 1

      base10_number = convert_from(digits, base_given)
      convert_to(base10_number, base_expected)
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
      intermediary = number
      converted_digits = []
      while intermediary >= base
        mod = intermediary % base
        int_res = intermediary / base
        converted_digits << mod
        intermediary = int_res
      end
      mod = intermediary % base
      converted_digits << mod
      converted_digits.reverse
    end
  end
end
