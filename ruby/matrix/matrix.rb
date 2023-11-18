# frozen_string_literal: true

# Implementation of the Matrix exercise in Ruby track on Exercism.
class Matrix
  attr_reader :rows, :columns

  # @param string [String]
  def initialize(string)
    @rows = string.each_line.map { |line| line.split.map(&:to_i) }
    @columns = rows.transpose
  end

  # @param index [Integer]
  # @return [Integer] row indicated by the index
  def row(index)
    rows[index - 1]
  end

  # @param index [Integer]
  # @return [Integer] column indicated by the index
  def column(index)
    columns[index - 1]
  end
end
