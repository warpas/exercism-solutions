# frozen_string_literal: true

# Implementation of the Gigasecond exercise in Ruby track on Exercism.
class Gigasecond
  def self.from(time)
    Time.at(time.to_i + 1_000_000_000)
  end
end
