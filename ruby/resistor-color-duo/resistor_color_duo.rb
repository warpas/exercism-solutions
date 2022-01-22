# frozen_string_literal: true

# Implementation of the Resistor Color Duo exercise in Ruby track on Exercism.
class ResistorColorDuo
  # Resistor color bands sorted by resistance values
  CODES = %w[black brown red orange yellow green blue violet grey white].freeze

  # @param colors [Array<String>] resistor band colors
  # @return [Integer] the resistance value for the given pair of colors
  def self.value(colors)
    colors.take(2).map { |c| CODES.index(c) }.join.to_i
  end
end
