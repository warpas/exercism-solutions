# frozen_string_literal: true

# The base Integer class extended to include conversion to Roman Numerals
class Integer
  def to_roman
    RomanNumeral.new(self).to_s
  end

  # Implementation of the Roman Numerals exercise in Ruby track on Exercism.
  class RomanNumeral
    def initialize(int)
      @as_integer = int
    end

    def to_s
      @roman_array ||= unleash_greed

      @roman_array.join
    end

    private

    CORRESPONDING_ROMAN_NUMERAL = {
      1 => 'I',
      4 => 'IV',
      5 => 'V',
      9 => 'IX',
      10 => 'X',
      40 => 'XL',
      50 => 'L',
      90 => 'XC',
      100 => 'C',
      400 => 'CD',
      500 => 'D',
      900 => 'CM',
      1000 => 'M'
    }.freeze

    private_constant :CORRESPONDING_ROMAN_NUMERAL

    attr_reader :as_integer

    def unleash_greed
      constructed_roman_array = []
      remainder = as_integer
      while remainder.positive?
        highest_available = next_highest(remainder)
        constructed_roman_array << corresponding(highest_available)
        remainder -= highest_available
      end

      constructed_roman_array
    end

    def next_highest(limit)
      CORRESPONDING_ROMAN_NUMERAL.keys.select { |key| key <= limit }.max
    end

    def corresponding(int)
      CORRESPONDING_ROMAN_NUMERAL[int]
    end

    # TODO: potentiall improvement - split the build into phases by the following 3 rules:
    # orders of magnitude - I, X, C, M
    # half steps to orders of magnitude - V, L, D
    # 1 less than OoM or HStOoM - IV, IX, XL, XC, CD, CM
  end

  private_constant :RomanNumeral
end
