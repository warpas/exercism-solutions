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
      5 => 'V',
      10 => 'X',
      50 => 'L',
      100 => 'C',
      500 => 'D',
      1000 => 'M'
    }.freeze

    private_constant :CORRESPONDING_ROMAN_NUMERAL

    attr_reader :as_integer

    def unleash_greed
      unfolded = unfold_greedily(as_integer, [], 0) do |num, acc|
        highest_available = next_highest(num)
        acc << highest_available
        [num - highest_available, acc]
      end

      # TODO: simplify the following iteration
      previous_array = unfolded
      new_array = []
      keep_doing_it = true
      while keep_doing_it
        new_array = replace_parrerns(previous_array)
        keep_doing_it = false if new_array == previous_array
        previous_array = new_array
      end
      new_array.map { |n| corresponding(n) }
    end

    def replace_parrerns(array)
      case array
      in [*left, 500, 100, 100, 100, 100, *right]
        left + [100, 1000] + right
      in [*left, 100, 100, 100, 100, *right]
        left + [100, 500] + right
      in [*left, 50, 10, 10, 10, 10, *right]
        left + [10, 100] + right
      in [*left, 10, 10, 10, 10, *right]
        left + [10, 50] + right
      in [*left, 5, 1, 1, 1, 1, *right]
        left + [1, 10] + right
      in [*left, 1, 1, 1, 1, *right]
        left + [1, 5] + right
      else
        array
      end
    end

    def unfold_greedily(number_to_unfold, array_to_unfold_into, end_state, &block)
      until number_to_unfold == end_state
        number_to_unfold, array_to_unfold_into = block.call(number_to_unfold, array_to_unfold_into)
      end

      array_to_unfold_into
    end

    def next_highest(limit)
      CORRESPONDING_ROMAN_NUMERAL.keys.select { |key| key <= limit }.max
    end

    def corresponding(int)
      CORRESPONDING_ROMAN_NUMERAL[int]
    end
  end

  private_constant :RomanNumeral
end
