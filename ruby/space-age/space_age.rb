# frozen_string_literal: true

# Implementation of the SpaceAge exercise in Ruby track on Exercism.
class SpaceAge
  EARTH_YEAR_IN_SECONDS = 31_557_600
  MERCURY_CONVERSION_RATIO = 0.2408467
  VENUS_CONVERSION_RATIO = 0.61519726
  MARS_CONVERSION_RATIO = 1.8808158
  JUPITER_CONVERSION_RATIO = 11.862615
  SATURN_CONVERSION_RATIO = 29.447498
  URANUS_CONVERSION_RATIO = 84.016846
  NEPTUNE_CONVERSION_RATIO = 164.79132

  def initialize(seconds)
    @seconds = seconds
  end

  def on_earth
    @seconds.to_f / EARTH_YEAR_IN_SECONDS
  end

  def on_mercury
    on_earth.to_f / MERCURY_CONVERSION_RATIO
  end

  def on_venus
    on_earth.to_f / VENUS_CONVERSION_RATIO
  end

  def on_mars
    on_earth.to_f / MARS_CONVERSION_RATIO
  end

  def on_jupiter
    on_earth.to_f / JUPITER_CONVERSION_RATIO
  end

  def on_saturn
    on_earth.to_f / SATURN_CONVERSION_RATIO
  end

  def on_uranus
    on_earth.to_f / URANUS_CONVERSION_RATIO
  end

  def on_neptune
    on_earth.to_f / NEPTUNE_CONVERSION_RATIO
  end
end
