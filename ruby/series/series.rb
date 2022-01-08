# frozen_string_literal: true

# Implementation of the Series exercise in Ruby track on Exercism.
class Series
  # @param string [String]
  def initialize(string)
    @series = string
  end

  # @param substring_length [Integer]
  # @raise [ArgumentError] if the desired substring length is longer than the string under consideration
  # @return [Array<String>] list of all substrings of the given length
  def slices(substring_length)
    valid_substring_length = @series.length - substring_length
    raise ArgumentError if valid_substring_length.negative?

    substrings = []
    0.upto(valid_substring_length) do |index|
      substrings << @series[index, substring_length]
    end
    substrings
  end
end
