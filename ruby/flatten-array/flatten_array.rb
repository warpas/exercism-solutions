# frozen_string_literal: true

# Implementation of the Flatten Array exercise in Ruby track on Exercism. Missing the point of the exercise!
class FlattenArray
  # @param array [Array<Integer, nil>]
  # @return [Array<Integer>]
  def self.flatten(array)
    recursive_flatten(array).reject(&:nil?)
  end

  def self.recursive_flatten(array)
    array.reduce([]) do |acc, elem|
      elem.instance_of?(Array) ? acc.concat(recursive_flatten(elem)) : acc.push(elem)
    end
  end

  private_class_method :recursive_flatten
end
