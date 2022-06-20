# frozen_string_literal: true

# Implementation of the Affine Cipher exercise in Ruby track on Exercism.
class Affine
  def initialize(a, b)
    puts ""
    p @a = a
    p @b = b
  end

  def encode(text)
    a_byte = 0
    'a'.each_byte do |a|
      a_byte = a
    end
    p a_byte
    p text
    bytes = []
    text.each_byte do |c|
      puts "inside the encode loop"
      p c
      byte_diff = c - a_byte
      p byte_diff
      calculated_encoding = (@a * byte_diff + @b) % ALPHABET_LENGTH
      bytes << calculated_encoding + a_byte
      p calculated_encoding
    end
    p bytes
    bytes.pack('c*')
  end

  ALPHABET_LENGTH = 26

  private_constant :ALPHABET_LENGTH
end
