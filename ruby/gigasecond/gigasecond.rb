# frozen_string_literal: true

# Implementation of the Gigasecond exercise in Ruby track on Exercism.
class Gigasecond
  # @param time [Time] Ruby Time instance
  # @return [Time] time after 1_000_000_000 seconds
  def self.from(time)
    time + GIGASECOND
  end

  GIGASECOND = 1e9
  private_constant :GIGASECOND
end
