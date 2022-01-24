# frozen_string_literal: true

# Implementation of the Matrix exercise in Ruby track on Exercism.
class Matrix
  attr_reader :rows, :columns

  # @param string [String]
  def initialize(string)
    @rows = string.each_line.map { |line| line.split.map(&:to_i) }
    @columns = rows.transpose
  end
end
