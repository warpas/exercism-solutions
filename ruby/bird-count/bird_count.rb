# frozen_string_literal: true

# Implementation of the Bird Count exercise in Ruby track on Exercism.
class BirdCount
  # @return [Array<Integer>] last week's bird counts
  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  # @param birds_per_day [Array<Integer>] this week's bird counts
  def initialize(birds_per_day)
    @birds_per_day = birds_per_day
  end

  # @return [Integer] yesterday's result
  def yesterday
    @birds_per_day[-2]
  end

  # @return [Integer] this week's total bird count
  def total
    @birds_per_day.reduce(:+)
  end

  # @return [Integer] the number of this week's busy days
  def busy_days
    @birds_per_day.count { |d| d > 4 }
  end

  # @return [Boolean] did this week have any empty days?
  def day_without_birds?
    !@birds_per_day.select(&:zero?).empty?
  end
end
