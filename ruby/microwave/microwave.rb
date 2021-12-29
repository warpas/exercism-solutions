# frozen_string_literal: true

# Implementation of the Microwave exercise in Ruby track on Exercism.
class Microwave

  # @param [Integer] time in microwave timer notation
  # @return [Integer] seconds from the microwave timer
  def initialize(time_notation)
    @minutes = time_notation / 100
    @seconds = time_notation % 100
  end

  # @param [void]
  # @return [String] timer formatted to mm:ss
  def timer
    "#{normalized_minutes}:#{normalized_seconds}"
  end

  private

  def normalized_seconds
    ts = @seconds % 60
    return ts if ts > 9

    "0#{ts}"
  end

  def normalized_minutes
    tm = @minutes + @seconds / 60
    return tm if tm > 9

    "0#{tm}"
  end
end
