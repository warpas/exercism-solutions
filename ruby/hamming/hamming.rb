# frozen_string_literal: true

# Implementation of the Hamming exercise in Ruby track on Exercism.
module Hamming
  # @param strand1 [String] first DNA strand
  # @param strand2 [String] second DNA strand
  # @raise [ArgumentError] if strands are of unequal length
  # @return [Integer] Hamming Distance between the two DNA strands
  def self.compute(strand1, strand2)
    raise ArgumentError if strand1.length != strand2.length

    strand1.length.times.count { |i| strand1[i] != strand2[i] }
  end
end
