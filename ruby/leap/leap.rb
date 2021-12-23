# frozen_string_literal: true

# Implementation of the Leap exercise in Ruby track on Exercism.
class Year
  def self.leap?(year)
    (year % 4).zero? && (year % 100 != 0 || year % 400.zero?)
  end
end
