# frozen_string_literal: true

# Implementation of the Crypto Square exercise in Ruby track on Exercism.
class Crypto
  # @param message [String]
  def initialize(message)
    @message = message
  end

  # @return [String] encoded version of the message
  def ciphertext
    normalized_message = normalize_text
    return '' if normalized_message.empty?

    @columns, @rows = square_sides(normalized_message.length)
    # p @columns
    # p @rows
    @square = square

    built = []
    columns.times do |row|
      line = []
      columns.times do |col|
        break if @square[col].nil?

        line << @square[col][row] unless @square[col][row].nil?
        line << ' ' if @square[col][row].nil?
      end
      built << line.join
    end

    built.join(' ')
  end

  private

  attr_reader :columns, :rows

  def normalize_text
    # normalized_no_join = @message.downcase.scan(/\w+/)#.join
    normalized_with_join = @message.downcase.scan(/\w+/).join
    # n_length_no_join = normalized_no_join.join.length
    # n_length_with_join = normalized_with_join.length
    # p "n_length_no_join = #{n_length_no_join}"
    # p "n_length_with_join = #{n_length_with_join}"
    @n_length = normalized_with_join.length
    @normalized = normalized_with_join
  end

  def square_sides(message_length)
    # return 0 if @normalized.nil?

    square_root = Math.sqrt(message_length)
    square_root_floor = square_root.floor
    longer_side = square_root.floor
    longer_side += 1 unless (message_length % square_root).zero?
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
