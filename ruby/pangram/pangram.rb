# frozen_string_literal: true

# Implementation of the Pangram exercise in Ruby track on Exercism.
class Pangram
  # @param [String] sentence to check
  # @return [Boolean] is the sentence a pangram?
  def self.pangram?(sentence)
    characters = sentence.downcase.chars.uniq
    characters.delete(' ')
    characters.delete('1')
    characters.count > 25
  end
end
