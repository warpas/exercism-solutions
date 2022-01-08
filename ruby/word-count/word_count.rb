# frozen_string_literal: true

# Implementation of the Word Count exercise in Ruby track on Exercism.
class Phrase
  # @param phrase [String]
  def initialize(phrase)
    @words = phrase.downcase.scan(/\b[\w']+\b/)
  end

  # @return [Hash<String, Integer>] Keys represent words from the inital phrase,
  #   values track the amount of times that word occurred
  def word_count
    @words.each_with_object(Hash.new(0)) do |word, hash|
      hash[word] += 1
    end
  end
end
