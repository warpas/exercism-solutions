# frozen_string_literal: true

# Implementation of the Isogram exercise in Ruby track on Exercism.
class Isogram
  # @param phrase [String]
  # @return [Boolean] is the phrase a isogram?
  def self.isogram?(phrase)
    letters = phrase.downcase.chars - ALLOWED_DUPLICATES
    letters == letters.uniq
  end

  ALLOWED_DUPLICATES = ['-', ' '].freeze
  private_constant :ALLOWED_DUPLICATES
end
