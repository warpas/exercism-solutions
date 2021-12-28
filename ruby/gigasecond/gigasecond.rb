# frozen_string_literal: true

# Implementation of the Gigasecond exercise in Ruby track on Exercism.
class Gigasecond

  # @param time [Time]
  # @return [Time] time after 1_000_000_000 seconds
  def self.from(time)
    time + 1e9
  end
end
