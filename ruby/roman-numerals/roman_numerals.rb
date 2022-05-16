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
      # 4 => 'IV',
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
      unfolded = unfold_greedily(as_integer, [], 0) do |num, acc|
        highest_available = next_highest(num)
        acc << highest_available
        [num - highest_available, acc]
      end
      p unfolded
      # p replace_fours_new(unfolded)
      # p replace_fours(unfolded)
      p(replace_fours_new(unfolded).map { |n| corresponding(n) })
      # p unfolded.map { |n| corresponding(n) }
    end

    def replace_fours_new(array)
      array => [*left, 1, 1, 1, 1, *right] rescue array
      if !left.nil?
        left + [1, 5] + right
        # new_array = left + [1, 5] + right
        # p "new method: #{left} .. . #{[1, 5]} . .. #{right}"
        # p new_array
        # new_array
      else
        array
      end
    end

    def replace_fours(array)
      longest_chain = 0
      last_number = 0
      this_chain = 1
      longest_chain_starts_at = 0
      chain_starts_at = 0
      array.each_with_index do |number, index|
        if last_number == number
          # p "#{last_number} == #{number} ? #{last_number == number}"
          this_chain += 1
        else
          last_number = number
          # p "longest_chain (#{longest_chain}) < this_chain (#{this_chain})"
          this_chain = 1
          chain_starts_at = index
        end
        if longest_chain < this_chain
          longest_chain = this_chain
          longest_chain_starts_at = chain_starts_at
        end
      end
      if longest_chain > 3
        # p "longest chain = #{longest_chain}, starts at #{longest_chain_starts_at}"
        replace(array, longest_chain, longest_chain_starts_at)
      else
        array
      end
    end

    def replace(array, replace_count, start_at)
      unmodified_start =
        if start_at.zero?
          []
        else
          array[0..start_at-1]
        end
      middle_to_change = array[start_at..start_at + replace_count]
      unmodified_end = array[start_at + replace_count..array.length]
      # p "#{unmodified_start} .. . #{middle_to_change} . .. #{unmodified_end}"
      middle_changed = [1, 5]
      # p "#{unmodified_start} .. . #{middle_changed} . .. #{unmodified_end}"
      [unmodified_start, middle_changed, unmodified_end].flatten
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

    # TODO: potentiall improvement - split the build into phases by the following 3 rules:
    # orders of magnitude - I, X, C, M
    # half steps to orders of magnitude - V, L, D
    # 1 less than OoM or HStOoM - IV, IX, XL, XC, CD, CM
  end

  private_constant :RomanNumeral
end
