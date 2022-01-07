# frozen_string_literal: true

# Implementation of the Pangram exercise in Ruby track on Exercism.
class Pangram
  ALL_LOWERCASE_LETTERS = [*'a'..'z'].freeze
  private_constant :ALL_LOWERCASE_LETTERS

  # @param sentence [String] to check
  # @return [Boolean] is the sentence a pangram?
  def self.pangram?(sentence)
    (ALL_LOWERCASE_LETTERS - sentence.downcase.chars).empty?
  end
end
