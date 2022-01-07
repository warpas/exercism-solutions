# frozen_string_literal: true

# Implementation of the Pangram exercise in Ruby track on Exercism.
class Pangram
  # @param sentence [String]
  # @return [Boolean] is the sentence a pangram?
  def self.pangram?(sentence)
    (LOWERCASE_ALPHABET - sentence.downcase.chars).empty?
  end

  LOWERCASE_ALPHABET = [*'a'..'z'].freeze
  private_constant :LOWERCASE_ALPHABET
end
