# frozen_string_literal: true

# Implementation of the Sieve exercise in Ruby track on Exercism.
class Sieve
  # @param number [Integer]
  def initialize(number)
    @limit = number
  end

  # @return [Array<Integer>]
  def primes
    primes = []
    2.upto(@limit) do |n|
      is_n_prime = true
      primes.each do |prime|
        is_n_prime = false if (n % prime).zero?
      end
      primes.push(n) if is_n_prime
    end
    primes
  end
end
