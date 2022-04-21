# frozen_string_literal: true

# Implementation of the Crypto Square exercise in Ruby track on Exercism.
class Crypto
  def initialize(string)
    @string = string
  end

  def ciphertext
    puts ""
    @normalized = normalized_text

    @columns, @rows = square_sides

    p "length = #{@normalized.length}; columns = #{columns}; rows = #{rows}"

    @square = square
    p square

    built = []
    rows.times do |row|
      p square[row]
      line = []
      columns.times do |col|
        line << square[col][row]
        p "row = #{row}, col = #{col}"
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
    square_root = Math.sqrt(@normalized.length).floor
    [square_root, square_root]
  end

  def square
    iteration = @normalized.chars
    built_square = []
    until iteration.empty?
      built_square << iteration.take(columns)
      iteration = iteration[columns..iteration.length]
    end

    built_square
  end
end
