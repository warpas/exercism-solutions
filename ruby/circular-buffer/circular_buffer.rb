# frozen_string_literal: true

# Implementation of the Circular Buffer exercise in Ruby track on Exercism.
class CircularBuffer
  # Error type for read attempts when the Buffer is empty
  class BufferEmptyException < RuntimeError; end
  # Error type for write attempts when the Buffer is full
  class BufferFullException < RuntimeError; end

  # @param size [Integer]
  def initialize(size)
    @size = size
    clear
  end

  # @return [String]
  def read
    raise BufferEmptyException if @buffer.empty?

    @buffer.shift
  end

  # @param char [String]
  # @return [Array]
  def write(char)
    raise BufferFullException if buffer_full?

    @buffer << char
  end

  # @param char [String]
  # @return [Array]
  def write!(char)
    @buffer.shift if buffer_full?

    @buffer << char
  end

  # @return [Array]
  def clear
    @buffer = []
  end

  private

  def buffer_full?
    @buffer.length >= @size
  end
end
