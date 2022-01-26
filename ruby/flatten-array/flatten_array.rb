# frozen_string_literal: true

# Implementation of the Flatten Array exercise in Ruby track on Exercism. Missing the point of the exercise!
class FlattenArray
  # @param array [Array<Integer, nil>]
  # @return [Array<Integer>]
  def self.flatten(array)
    recursive_flatten(array).reject(&:nil?)
  end

  def self.recursive_flatten(array)
    flattened_array = []
    array.each do |elem|
      if elem.instance_of?(Array)
        flattened_array.concat recursive_flatten(elem)
      else
        flattened_array.push(elem)
      end
    end
    flattened_array
  end

  private_class_method :recursive_flatten
end
