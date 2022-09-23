# frozen_string_literal: true

# Implementation of the Affine Cipher exercise in Ruby track on Exercism.
class Affine
  def initialize(key_component_a, key_component_b)
    raise ArgumentError, 'a and m must be coprime.' if coprime?(key_component_a)

    @key_component_a = key_component_a
    @key_component_b = key_component_b
  end

  def encode(text)
    prepared_text = text.downcase.split(/[-\s]/).join
    without_commas = prepared_text.split(/,/).join
    processed_text = without_commas.split(/[.]/).join

    bytes = []
    processed_text.each_byte do |c|
      bytes << encoded_character(c)
    end
    result = bytes.pack('c*')
    insert_spaces(result)
  end

  def decode(text)
    @mapping = calculate_mapping
    processed_text = text.downcase.split(/[-\s]/).join

    bytes = []
    processed_text.each_byte do |c|
      bytes << decoded_character(c)
    end
    bytes.pack('c*')
  end

  private

  ALPHABET_LENGTH = 26
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
      with_spaces << ' ' if (index % 5).zero? && index.positive?
      with_spaces << char
    end
    with_spaces.join
  end

  def coprime?(number)
    m_factors = [2, 13]
    m_factors.each do |factor|
      return true if (number % factor).zero?
    end

    false
  end

  def decoded_character(char)
    return char if char <= 60 && char > 47

    byte_diff = char - start_of_alphabet
    @mapping[byte_diff] + start_of_alphabet
  end

  def calculate_mapping
    mapping = {}

    (0..25).each do |key|
      formula = @key_component_a * key + @key_component_b
      encoding = formula % ALPHABET_LENGTH
      mapping[encoding] = key
    end

    mapping
  end
end
# TODO: there is room to grow on this solution
