# frozen_string_literal: true

# Implementation of the Nth Prime exercise in Ruby track on Exercism.
class Prime
  # @param index [Integer]
  # @return [Integer]
  def self.nth(index)
    raise ArgumentError if index <= 0

    primes = [2]
    candidate = 3
    while index > primes.length
      primes << candidate if viable_candidate?(primes, candidate)
      candidate += 2
    end
    primes[index - 1]
  end

  def self.viable_candidate?(primes, candidate)
    upper_limit = Math.sqrt candidate

    is_viable = true
    primes.each do |divisor|
      break if divisor > upper_limit
      return false if (candidate % divisor).zero?
    end

    is_viable
  end

  private_class_method :viable_candidate?
end
