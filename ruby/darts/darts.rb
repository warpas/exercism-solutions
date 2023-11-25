# frozen_string_literal: true

# Implementation of the Darts exercise in Ruby track on Exercism.
class Darts
  def initialize(x, y)
    @x = x.abs
    @y = y.abs

    @boundary = @x * @x + @y * @y
  end

  def score
    return 0 if @boundary > 100
    return 1 if @boundary > 25
    return 5 if @boundary > 1

    10
  end
end
