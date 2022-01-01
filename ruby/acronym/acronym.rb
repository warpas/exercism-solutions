# frozen_string_literal: true

# Implementation of the Acronym exercise in Ruby track on Exercism.
class Acronym
  # @param [String] sentence
  # @return [String] acronym of the input
  def self.abbreviate(string)
    string.split(/[-\s]/).map(&:chr).join.upcase
  end
end
