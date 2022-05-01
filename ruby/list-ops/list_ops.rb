# frozen_string_literal: true

# Implementation of the List Ops exercise in Ruby track on Exercism.
class ListOps
  # The point of this exercise is to implement those functions without calling existing functions.
  # TODO: rewrite without calling existing functions
  class << self
    def arrays(arg)
      return 0 if arg.empty?

      arg.length
    end

    def reverser(arg)
      arg.reverse
    end

    def concatter(list1, list2)
      list1.concat(list2)
    end

    def mapper(arg, &block)
      arg.reduce([]) { |array, n| array << block.call(n) }
    end

    def filterer(arg, &block)
      arg.filter { |n| block.call(n) }
    end

    def sum_reducer(arg)
      arg.sum
    end

    def factorial_reducer(arg)
      arg.reduce(1, &:*)
    end
  end
end
