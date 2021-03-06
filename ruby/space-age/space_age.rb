# frozen_string_literal: true

# Implementation of the SpaceAge exercise in Ruby track on Exercism.
class SpaceAge
  EARTH_YEAR_IN_SECONDS = 31_557_600
  private_constant :EARTH_YEAR_IN_SECONDS

  PLANET_YEAR_TO_EARTH_RATIO = {
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }.freeze
  private_constant :PLANET_YEAR_TO_EARTH_RATIO

  def initialize(seconds)
    @seconds = seconds
  end

  PLANET_YEAR_TO_EARTH_RATIO.each do |planet_name, year_ratio|
    define_method("on_#{planet_name}") do
      @seconds.fdiv(EARTH_YEAR_IN_SECONDS * year_ratio)
    end
  end
end
