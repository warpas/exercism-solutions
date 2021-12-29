# frozen_string_literal: true

# Implementation of the Microwave exercise in Ruby track on Exercism.
class Microwave
  TIMER_FORMAT = '%<min>02d:%<sec>02d'
  # @param [Integer] time in microwave timer notation
  # @return [Integer] seconds from the microwave timer
  def initialize(time_notation)
    @minutes = (time_notation / 100) + (time_notation % 100 / 60)
    @seconds = (time_notation % 100) % 60
  end

  # @param [void]
  # @return [String] timer formatted to mm:ss
  def timer
    format(TIMER_FORMAT, { min: @minutes, sec: @seconds })
  end
end
