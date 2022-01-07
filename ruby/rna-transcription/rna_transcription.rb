# frozen_string_literal: true

# Implementation of the Complement exercise in Ruby track on Exercism.
class Complement
  RNA = 'CGAU' # translation sequence for RNA
  DNA = 'GCTA' # translation sequence for DNA

  # @param strand [String] DNA strand
  # @return [String] transcribed RNA strand
  def self.of_dna(strand)
    strand.tr(DNA, RNA)
  end
end
