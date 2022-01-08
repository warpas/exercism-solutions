# frozen_string_literal: true

# Implementation of the Hamming exercise in Ruby track on Exercism.
module Hamming
  # @param strand1 [String] first DNA strand
  # @param strand2 [String] second DNA strand
  # @raise [ArgumentError] if strands are of unequal length
  # @return [Integer] Hamming Distance between the two DNA strands
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.length != strand2.length

    differences = 0
    strand1_array = strand1.chars
    strand2_array = strand2.chars
    0.upto(strand1.length - 1) do |index|
      differences += 1 if strand1_array[index] != strand2_array[index]
    end
    differences
  end
end
