# frozen_string_literal: true

# Implementation of the Raindrops exercise in Ruby track on Exercism.
module Raindrops
  # @param number [Integer]
  # @return [String]
  def self.convert(number)
    sounds = ''
    sounds += 'Pling' if (number % 3).zero?
    sounds += 'Plang' if (number % 5).zero?
    sounds += 'Plong' if (number % 7).zero?
    return sounds unless sounds.empty?

    number.to_s
  end
end
