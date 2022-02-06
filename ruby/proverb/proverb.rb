# frozen_string_literal: true

# Implementation of the Proverb exercise in Ruby track on Exercism.
class Proverb
  # @param words [String]
  def initialize(*words, qualifier: '')
    @words = words
    @qualifier = qualifier
  end

  def to_s
    build = ''
    @words.each_with_index do |word, index|
      next_word = @words[index + 1]
      build += regular_line(word, next_word) unless next_word.nil?
    end
    build + last_line
  end

  private

  def regular_line(word1, word2)
    "For want of a #{word1} the #{word2} was lost.\n"
  end

  def last_line
    line = "And all for the want of a "
    line += "#{@qualifier} " unless @qualifier.empty?
    line += "#{@words.first}."
    line
  end
end
