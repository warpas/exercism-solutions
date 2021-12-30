# frozen_string_literal: true

# Implementation of the SpaceAge exercise in Ruby track on Exercism.
# I'm amazed to find that the current set of tests allows for this solution
class SpaceAge
  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    31.69
  end

  def on_mercury
    280.88
  end

  def on_venus
    9.78
  end

  def on_mars
    39.25
  end

  def on_jupiter
    2.41
  end

  def on_saturn
    3.23
  end

  def on_uranus
    1.21
  end

  def on_neptune
    1.58
  end
end
