# frozen_string_literal: true

# Implementation of the Flatten Array exercise in Ruby track on Exercism. Missing the point of the exercise!
class FlattenArray
  # @param array [Array<Integer, nil>]
  # @return [Array<Integer>]
  def self.flatten(array)
    array.flatten.reject(&:nil?)
  end
end
