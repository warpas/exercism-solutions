# frozen_string_literal: true

# Implementation of the Clock exercise in Ruby track on Exercism.
class Clock
  attr_reader :hour, :minute

  # @param hour [Integer]
  # @param minute [Integer]
  def initialize(hour: 0, minute: 0)
    assignments(hour, minute)
  end

  # @return [String] Clock formatted in HH:MM
  def to_s
    "#{add_zero(hour)}:#{add_zero(minute)}"
  end

  # @param other [Clock]
  # @return [Clock] sum of the two clocks
  def +(other)
    assignments(hour + other.hour, minute + other.minute)
    self
  end

  # @param other [Clock]
  # @return [Clock] the original clock after subtracting the other one
  def -(other)
    assignments(hour - other.hour, minute - other.minute)
    self
  end

  # @param other [Clock]
  # @return [Boolean] is Clock equal to the other one?
  def ==(other)
    hour == other.hour && minute == other.minute
  end

  private

  def assignments(hour, minute)
    calculate_hour(hour, minute)
    calculate_minute(minute)
  end

  def calculate_hour(hour, minute)
    @hour = (hour + minute / 60) % 24
  end

  def calculate_minute(minute)
    @minute = minute % 60
  end

  def add_zero(num)
    zero = num > 9 ? '' : '0'
    "#{zero}#{num}"
  end
end
