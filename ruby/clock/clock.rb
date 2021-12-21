# frozen_string_literal: true

# Implementation of the Clock exercise in Ruby track on Exercism.
class Clock
  attr_reader :hour, :minute

  def initialize(hour: 0, minute: 0)
    @hour = (hour + minute / 60) % 24
    @minute = minute % 60
  end

  def to_s
    "#{hours_to_s}:#{minutes_to_s}"
  end

  def +(other)
    @hour = (hour + other.hour + (minute + other.minute) / 60) % 24
    @minute = (minute + other.minute) % 60
    self
  end

  def -(other)
    @hour = (hour - other.hour + (minute - other.minute) / 60) % 24
    @minute = (minute - other.minute) % 60
    self
  end

  def ==(other)
    @hour == other.hour && @minute == other.minute
  end

  private

  def hours_to_s
    hour > 9 ? hour.to_s : "0#{hour}"
  end

  def minutes_to_s
    minute > 9 ? minute.to_s : "0#{minute}"
  end
end
