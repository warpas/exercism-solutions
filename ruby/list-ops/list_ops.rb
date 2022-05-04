# frozen_string_literal: true

# Implementation of the List Ops exercise in Ruby track on Exercism.
module ListOps
  # The point of this exercise is to implement those functions without calling existing functions.
  # TODO: rewrite without calling existing functions
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
      array.reduce(start) { |acc, elem| block.call(acc, elem) }
    end
  end
end
