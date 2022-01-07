# frozen_string_literal: true

# Implementation of the Two Fer exercise in Ruby track on Exercism.
class TwoFer
  # @param name [String]
  # @return [String] personalized greeting
  def self.two_fer(name = 'you')
    "One for #{name}, one for me."
  end
end
