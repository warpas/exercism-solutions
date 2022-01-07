# frozen_string_literal: true

# Implementation of the RNA Transcription exercise in Ruby track on Exercism.
class Complement
  # @param strand [String] DNA strand
  # @return [String] transcribed RNA strand
  def self.of_dna(strand)
    strand.tr(DNA, RNA)
  end

  RNA = 'CGAU'
  DNA = 'GCTA'
  private_constant :RNA
  private_constant :DNA
end
