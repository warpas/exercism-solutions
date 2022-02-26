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
    while index > primes.length
      viable = true
      sqrt_of_candidate = Math.sqrt candidate
      primes.each do |divisor|
        break if divisor > sqrt_of_candidate

        if (candidate % divisor).zero?
          viable = false
          break
        end
      end
      primes.push(candidate) if viable
      candidate += 1
    end
    primes[index - 1]
  end
end
