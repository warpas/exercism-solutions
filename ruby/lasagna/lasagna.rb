# frozen_string_literal: true

# Implementation of the Lasagna exercise in Ruby track on Exercism.
class Lasagna
  # expected time in the oven in minutes
  EXPECTED_MINUTES_IN_OVEN = 40

  # @param actual_minutes_in_oven [Integer]
  def remaining_minutes_in_oven(actual_minutes_in_oven)
    EXPECTED_MINUTES_IN_OVEN - actual_minutes_in_oven
  end

  # @param layers [Integer]
  # @return [Integer] preparation time in minutes
  def preparation_time_in_minutes(layers)
    layers * 2
  end

  # @param number_of_layers [Integer]
  # @param actual_minutes_in_oven [Integer]
  # @return [Integer] total time in minutes
  def total_time_in_minutes(number_of_layers:, actual_minutes_in_oven:)
    preparation_time_in_minutes(number_of_layers) + actual_minutes_in_oven
  end
end
