# frozen_string_literal: true

# Implementation of the Strain exercise in Ruby track on Exercism.
# Missing the point of the exercise!
class Array
  # @param block [Block]
  # @return [Array]
  def keep(&block)
    create_subarray_by(true, &block)
  end

  # @param block [Block]
  # @return [Array]
  def discard(&block)
    create_subarray_by(false, &block)
  end

  private

  def create_subarray_by(bool, &condition)
    kept_array = []
    each do |elem|
      kept_array << elem if condition.call(elem) == bool
    end
    kept_array
  end
end
