# frozen_string_literal: true

# Implementation of the Affine Cipher exercise in Ruby track on Exercism.
class Affine
  def initialize(a, b)
    puts ""
    @key_component_a = a
    @key_component_b = b
  end

  def encode(text)
    prepared_text = text.downcase.split(/[-\s]/).join
    a_byte = 0
    'a'.each_byte do |a|
      a_byte = a
    end
    # p a_byte
    # p text
    bytes = []
    prepared_text.each_byte do |c|
      # puts "inside the encode loop"
      # p c
      byte_diff = c - a_byte
      # p byte_diff
      calculated_encoding = (@key_component_a * byte_diff + @key_component_b) % ALPHABET_LENGTH
      bytes << calculated_encoding + a_byte
      # p calculated_encoding
    end
    # p bytes
    result = bytes.pack('c*')

    insert_spaces(result)
  end

  ALPHABET_LENGTH = 26

  private

  private_constant :ALPHABET_LENGTH

  def insert_spaces(string)
    with_spaces = []
    string.chars.each_with_index do |char, index|
      with_spaces << ' ' if index % 5 == 0 && index > 0
      with_spaces << char
    end
    with_spaces.join
  end
end
