# frozen_string_literal: true

# Implementation of the Leap exercise in Ruby track on Exercism.
class Year
  # @param year [Integer]
  # @return [Boolean] is the year a leap year?
  def self.leap?(year)
    (year % 4).zero? && ((year % 100).positive? || (year % 400).zero?)
  end
end
