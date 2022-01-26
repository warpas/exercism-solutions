# frozen_string_literal: true

# Implementation of the Flatten Array exercise in Ruby track on Exercism. Missing the point of the exercise!
class FlattenArray
  class << self
    # @param array [Array<Integer, nil>]
    # @return [Array<Integer>]
    def flatten(array)
      recursive_flatten(array).reject(&:nil?)
    end

    def recursive_flatten(array)
      array.reduce([]) do |acc, elem|
        elem.instance_of?(Array) ? acc.concat(recursive_flatten(elem)) : acc.push(elem)
      end
    end

  end

  private_class_method :recursive_flatten
end
