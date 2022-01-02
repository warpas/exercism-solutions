# frozen_string_literal: true

# Implementation of the Acronym exercise in Ruby track on Exercism.
class Acronym
  # @param sentence [String] sentence
  # @return [String] acronym of the input sentence
  def self.abbreviate(sentence)
    sentence.split(/[-\s]/).map(&:chr).join.upcase
  end
end
