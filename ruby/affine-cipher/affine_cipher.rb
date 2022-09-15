# frozen_string_literal: true

# Implementation of the Affine Cipher exercise in Ruby track on Exercism.
class Affine
  def initialize(key_component_a, key_component_b)
    @key_component_a = key_component_a
    @key_component_b = key_component_b
  end

  def encode(text)
    # p text
    prepared_text = text.downcase.split(/[-\s]/).join
    without_commas = prepared_text.split(/,/).join
    without_dots = without_commas.split(/[.]/).join
    # p without_dots
    bytes = []
    without_dots.each_byte do |c|
      bytes << encoded_character(c)
    end
    # p bytes
    result = bytes.pack('c*')

    # p result
    p insert_spaces(result)
  end

  ALPHABET_LENGTH = 26

  private

  private_constant :ALPHABET_LENGTH

  def start_of_alphabet
    a_byte = 0
    'a'.each_byte do |a|
      a_byte = a
    end

    a_byte
  end

  def encoded_character(char)
    return char if char <= 60 && char > 47

    byte_diff = char - start_of_alphabet
    calculated_encoding = (@key_component_a * byte_diff + @key_component_b) % ALPHABET_LENGTH

    calculated_encoding + start_of_alphabet
  end

  def insert_spaces(string)
    with_spaces = []
    string.chars.each_with_index do |char, index|
      with_spaces << ' ' if index % 5 == 0 && index > 0
      with_spaces << char
    end
    with_spaces.join
  end
end
