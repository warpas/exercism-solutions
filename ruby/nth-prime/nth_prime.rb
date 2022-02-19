# frozen_string_literal: true

# Implementation of the Nth Prime exercise in Ruby track on Exercism.
class Prime
  # @param index [Integer]
  # @return [Integer]
  def self.nth(index)
    raise ArgumentError if index <= 0

    candidates = (2..index * 15)
    primes = []
    while index > primes.length do
      current_prime = candidates.first
      candidates = candidates.reject { |elem| (elem % current_prime).zero? }
      primes.push(current_prime)
    end
    primes.last
  end
end
