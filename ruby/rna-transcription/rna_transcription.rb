# frozen_string_literal: true

# Implementation of the Complement exercise in Ruby track on Exercism.
class Complement
  # the Hash of basic complements for transcriptions
  COMPLEMENTS = {
    G: 'C',
    C: 'G',
    T: 'A',
    A: 'U'
  }.freeze

  # @param strand [String] RNA strand
  # @return [String] transcribed RNA strand
  def self.of_dna(strand)
    strand.chars.map { |nucleotide| COMPLEMENTS[nucleotide.to_sym] }.join
  end
end
