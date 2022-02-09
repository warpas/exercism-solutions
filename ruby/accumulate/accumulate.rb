# frozen_string_literal: true

# Implementation of the Accumulate exercise in Ruby track on Exercism.
class Array
  def accumulate(&block)
    new_array = []
    each do |n|
      new_array.push(block.call(n))
    end
    new_array
  end
end
