# frozen_string_literal: true

# Implementation of the Triangle exercise in Ruby track on Exercism.
class Triangle
  # @param sides [Array] a list of side lengths of a triangle
  def initialize(sides)
    @sides = sides
    @distinct_side_lengths = sides.uniq.count
    @is_proper_triangle = triangle?
  end

  # @return [Boolean] is the triangle equilateral?
  def equilateral?
    is_proper_triangle && distinct_side_lengths == 1
  end

  # @return [Boolean] is the triangle isoscales?
  def isosceles?
    is_proper_triangle && distinct_side_lengths <= 2
  end

  # @return [Boolean] is the triangle scalene?
  def scalene?
    is_proper_triangle && distinct_side_lengths == 3
  end

  private

  attr_reader :is_proper_triangle, :distinct_side_lengths

  def triangle?
    shortest_side, longest_side = @sides.minmax
    shortest_side.positive? && @sides.sum >= longest_side * 2
  end
end
