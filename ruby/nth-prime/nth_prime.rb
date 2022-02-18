# frozen_string_literal: true

# Implementation of the Nth Prime exercise in Ruby track on Exercism.
class Prime
  # @param index [Integer]
  # @return [Integer]
  def self.nth(index)
    raise ArgumentError if index <= 0
    return 3 if index == 2

    primes = [2]
    candidate = 3
    while index > primes.length do
      viable = true
      primes.each do |divisor|
        viable = false if (candidate % divisor).zero?
      end
      primes.push(candidate) if viable
      candidate += 1
    end
    primes[index - 1]
  end
end
