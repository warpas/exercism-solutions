# frozen_string_literal: true

# Implementation of the Affine Cipher exercise in Ruby track on Exercism.
class Affine
  def initialize(key_component_a, key_component_b)
    raise ArgumentError, 'a and m must be coprime.' if coprime?(key_component_a)

    @key_component_a = key_component_a
    @key_component_b = key_component_b
    p "@key_a = #{@key_component_a}, @key_b = #{@key_component_b}"
    encode('exercism')
  end

  def encode(text)
    puts "ENCODE"
    p text
    prepared_text = text.downcase.split(/[-\s]/).join
    without_commas = prepared_text.split(/,/).join
    processed_text = without_commas.split(/[.]/).join
    # p processed_text
    bytes = []
    processed_text.each_byte do |c|
      bytes << encoded_character(c)
    end
    # p bytes
    result = bytes.pack('c*')

    p insert_spaces(result)
    insert_spaces(result)
  end

  ALPHABET_LENGTH = 26

  def decode(text)
    puts "DECODE"
    p text
    processed_text = text.downcase.split(/[-\s]/).join
    # 'exercism'

    bytes = []
    processed_text.each_byte do |c|
      bytes << decoded_character(c)
    end

    result = bytes.pack('c*')
    p result
  end

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

    p "#{char} -> #{calculated_encoding + start_of_alphabet}, byte_diff = #{byte_diff}, calc_enc = #{(@key_component_a * byte_diff + @key_component_b)}, calc_enc mod ALPHABET_LENGTH = #{calculated_encoding}"
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
    byte_diff = char - start_of_alphabet
    calculated_encoding = (@key_component_a * byte_diff + @key_component_b) % ALPHABET_LENGTH

    p "#{char} -> #{calculated_encoding + start_of_alphabet}, byte_diff = #{byte_diff}, calc_enc = #{(@key_component_a * byte_diff + @key_component_b)}, calc_enc mod ALPHABET_LENGTH = #{calculated_encoding}"
    calculated_encoding + start_of_alphabet
    # char
  end
end
