# frozen_string_literal: true

# Implementation of the Triangle exercise in Ruby track on Exercism.
class Triangle
  # @param sides [Array] a list of side lengths of a triangle
  def initialize(sides)
    @sides = sides
    minmax = sides.minmax
    @shortest_side = minmax.first
    @longest_side = minmax.last
  end

  # @return [Boolean] is the triangle equilateral?
  def equilateral?
    triangle? && all_sides_equal?
  end

  # @return [Boolean] is the triangle isoscales?
  def isosceles?
    triangle? && any_two_sides_equal?
  end

  # @return [Boolean] is the triangle scalene?
  def scalene?
    triangle? && no_two_sides_equal?
  end

  private

  attr_reader :longest_side, :shortest_side

  def side1_eq_side2?
    @sides[0] == @sides[1]
  end

  def side1_eq_side3?
    @sides[0] == @sides[2]
  end

  def side2_eq_side3?
    @sides[1] == @sides[2]
  end

  def any_two_sides_equal?
    side1_eq_side2? || side1_eq_side3? || side2_eq_side3?
  end

  def no_two_sides_equal?
    !any_two_sides_equal?
  end

  def all_sides_equal?
    shortest_side == longest_side
  end

  def perimiter_longer_that_twice_the_longest_side?
    @sides.sum >= longest_side * 2
  end

  def triangle?
    shortest_side.positive? && perimiter_longer_that_twice_the_longest_side?
  end
end
