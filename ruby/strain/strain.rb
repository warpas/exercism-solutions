# frozen_string_literal: true

# Implementation of the Strain exercise in Ruby track on Exercism.
# Missing the point of the exercise!
class Array
  # @param block [Block]
  # @return [Array]
  def keep(&block)
    select do |elem|
      block.call(elem)
    end
  end

  # @param block [Block]
  # @return [Array]
  def discard(&block)
    reject do |elem|
      block.call(elem)
    end
  end
end
