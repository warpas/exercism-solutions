# frozen_string_literal: true

# Implementation of the All Your Base exercise in Ruby track on Exercism.
class BaseConverter
  class << self
    def convert(base_given, digits, base_expected)
      raise ArgumentError if base_given <= 1 || base_expected <= 1

      sum = 0
      digits.reverse.each_with_index do |digit, index|
        raise ArgumentError if digit.negative? || digit >= base_given

        sum += digit * (base_given**index)
      end

      intermediary = sum
      converted_digits = []
      while intermediary >= base_expected
        mod = intermediary % base_expected
        int_res = intermediary / base_expected
        converted_digits << mod
        intermediary = int_res
      end
      mod = intermediary % base_expected
      converted_digits << mod
      converted_digits.reverse
    end
  end
end
