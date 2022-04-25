# frozen_string_literal: true

# Implementation of the Crypto Square exercise in Ruby track on Exercism.
class Crypto
  # @param message [String]
  def initialize(message)
    @raw_message = message
  end

  # @return [String] encoded version of the message
  def ciphertext
    normalized_message = normalize_text
    return '' if normalized_message.empty?

    column_count = square_sides(normalized_message.length)
    square_message = square(normalized_message, column_count)

    transpose(square_message, column_count)
  end

  private

  def normalize_text
    @raw_message.downcase.scan(/\w+/).join
  end

  def square_sides(message_length)
    square_root = Math.sqrt(message_length)
    floor = square_root.floor
    (message_length % square_root).zero? ? floor : floor + 1
  end

  def square(message, width)
    iteration = message.chars
    built_square = []
    until iteration.nil? || iteration.empty?
      fs = iteration.take(width)
      built_square << fs
      iteration = iteration[width..iteration.length]
    end

    built_square
  end

  def transpose(square, count)
    built = []
    count.times do |row|
      line = []
      count.times do |col|
        break if square[col].nil?

        line << square[col][row] unless square[col][row].nil?
        line << ' ' if square[col][row].nil?
      end
      built << line.join
    end

    built.join(' ')
  end
end
