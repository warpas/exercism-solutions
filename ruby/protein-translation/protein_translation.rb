# frozen_string_literal: true

class InvalidCodonError < RuntimeError
end

# Implementation of the Translation exercise in Ruby track on Exercism.
class Translation
  CODONS = {
    'AUG'	=> 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA'	=> 'Leucine',
    'UUG'	=> 'Leucine',
    'UCU'	=> 'Serine',
    'UCC'	=> 'Serine',
    'UCA'	=> 'Serine',
    'UCG'	=> 'Serine',
    'UAU'	=> 'Tyrosine',
    'UAC'	=> 'Tyrosine',
    'UGU'	=> 'Cysteine',
    'UGC'	=> 'Cysteine',
    'UGG'	=> 'Tryptophan',
    'UAA'	=> 'STOP',
    'UAG'	=> 'STOP',
    'UGA'	=> 'STOP'
  }.freeze

  def self.of_codon(codon)
    CODONS[codon]
  end

  def self.of_rna(strand)
    rna = []
    (strand.length / 3).times do |time|
      codon = strand[time * 3, 3]
      value = of_codon(codon)
      raise InvalidCodonError if value.nil?
      break if value == 'STOP'

      rna << value
    end
    rna.uniq
  end
end
