# frozen_string_literal: true

# Implementation of the Crypto Square exercise in Ruby track on Exercism.
class Crypto
  def initialize(string)
    @string = string
  end

  def ciphertext
    @normalized = normalized_text
    return @normalized if @normalized.empty?

    @columns, @rows = square_sides
    @square = square

    built = []
    columns.times do |row|
      line = []
      columns.times do |col|
        break if square[col].nil?

        line << square[col][row] unless square[col][row].nil?
        line << ' ' if square[col][row].nil?
      end
      built << line.join
    end

    built.join(' ')
  end

  private

  attr_reader :columns, :rows

  def normalized_text
    @string.downcase.scan(/\w+/).join
  end

  def square_sides
    return 0 if @normalized.nil?

    square_root = Math.sqrt(@normalized.length)
    square_root_floor = square_root.floor
    longer_side = square_root.floor
    longer_side += 1 unless (@normalized.length % square_root).zero?
    [longer_side, square_root_floor]
  end

  def square
    iteration = @normalized.chars
    built_square = []
    until iteration.nil? || iteration.empty?
      fs = iteration.take(columns)
      built_square << fs
      iteration = iteration[columns..iteration.length]
    end

    built_square
  end
end
