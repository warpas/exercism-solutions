# frozen_string_literal: true

# Implementation of the List Ops exercise in Ruby track on Exercism.
module ListOps
  class << self
    def arrays(arg)
      fold(arg, 0) { |length, _elem| length + 1 }
    end

    def reverser(arg)
      fold(arg, []) { |list, elem| list.unshift elem }
    end

    def concatter(list1, list2)
      fold(list2, list1) { |acc, elem| acc << elem }
    end

    def mapper(arg, &block)
      fold(arg, []) { |array, n| array << block.call(n) }
    end

    def filterer(arg, &block)
      fold(arg, []) { |acc, elem| block.call(elem) ? acc << elem : acc }
    end

    def sum_reducer(arg)
      fold(arg, 0, &:+)
    end

    def factorial_reducer(arg)
      fold(arg, 1, &:*)
    end

    private

    def fold(array, start, &block)
      # TODO: improve the implementation with `yield`
      accumulator = start
      array.each do |elem|
        accumulator = block.call(accumulator, elem)
      end
      accumulator
    end
  end
end
