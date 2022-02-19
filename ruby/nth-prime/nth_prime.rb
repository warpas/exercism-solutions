# frozen_string_literal: true

require 'prime'
StdlibPrime = Object.send(:remove_const, :Prime)

# Implementation of the Nth Prime exercise in Ruby track on Exercism.
class Prime
  # @param index [Integer]
  # @return [Integer]
  def self.nth(index)
    raise ArgumentError if index <= 0

    StdlibPrime.first(index).last
  end
end
