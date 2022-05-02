# frozen_string_literal: true

# Implementation of the List Ops exercise in Ruby track on Exercism.
module ListOps
  # The point of this exercise is to implement those functions without calling existing functions.
  # TODO: rewrite without calling existing functions
  class << self
    def arrays(arg)
      arg.reduce(0) { |length, _elem| length + 1 }
    end

    def reverser(arg)
      arg.reduce([]) { |list, elem| list.unshift elem }
    end

    def concatter(list1, list2)
      list2.reduce(list1) { |acc, elem| acc << elem }
    end

    def mapper(arg, &block)
      arg.reduce([]) { |array, n| array << block.call(n) }
    end

    def filterer(arg, &block)
      arg.filter { |n| block.call(n) }
    end

    def sum_reducer(arg)
      arg.reduce(0, &:+)
    end

    def factorial_reducer(arg)
      arg.reduce(1, &:*)
    end
  end
end
