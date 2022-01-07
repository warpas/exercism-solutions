# frozen_string_literal: true

class InvalidCodonError < RuntimeError
end

# Implementation of the Translation exercise in Ruby track on Exercism.
class Translation
  def self.of_codon(codon)
    protein = CODONS[codon.to_sym]
    protein || raise(InvalidCodonError)
  end

  def self.of_rna(strand)
    strand.scan(/.../).reduce([]) do |chain, codon|
      protein = of_codon(codon)
      return chain if protein == 'STOP'

      chain << protein
    end
  end

  CODONS = {
    AUG: 'Methionine',
    UUU: 'Phenylalanine',
    UUC: 'Phenylalanine',
    UUA: 'Leucine',
    UUG: 'Leucine',
    UCU: 'Serine',
    UCC: 'Serine',
    UCA: 'Serine',
    UCG: 'Serine',
    UAU: 'Tyrosine',
    UAC: 'Tyrosine',
    UGU: 'Cysteine',
    UGC: 'Cysteine',
    UGG: 'Tryptophan',
    UAA: 'STOP',
    UAG: 'STOP',
    UGA: 'STOP'
  }.freeze
  private_constant :CODONS
end
