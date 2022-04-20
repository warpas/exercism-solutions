# frozen_string_literal: true

# Implementation of the Crypto Square exercise in Ruby track on Exercism.
class Crypto
  def initialize(string)
    @string = string
  end

  def ciphertext
    @string.strip.downcase
  end
end
