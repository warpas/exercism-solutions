# frozen_string_literal: true

# Implementation of the Assembly Line exercise in Ruby track on Exercism.
class AssemblyLine
  # Number of cars produced at 1x speed
  FLAWLESS_RATE = 221
  private_constant :FLAWLESS_RATE

  def initialize(speed)
    @speed = speed
  end

  # @return [Float] production rate per hour that takes success rate into account
  def production_rate_per_hour
    (@speed * FLAWLESS_RATE * success_rate).to_f
  end

  # @return [Integer] number of successfully produced items per minute
  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end

  private

  def success_rate
    case @speed
    when 1..4
      1
    when 5..8
      0.9
    when 9
      0.8
    when 10
      0.77
    end
  end
end
