# frozen_string_literal: true

# Implementation of the Resistor Color exercise in Ruby track on Exercism.
class ResistorColor
  # Resistor color bands sorted by resistance values
  COLORS = %w[black brown red orange yellow green blue violet grey white].freeze

  # @param color [String] resistor band color
  # @return [Integer] the resistance value for the given color
  def self.color_code(color)
    COLORS.index(color)
  end
end
