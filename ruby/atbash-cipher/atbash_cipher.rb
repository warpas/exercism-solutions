# frozen_string_literal: true

# Implementation of the Atbash Cipher exercise in Ruby track on Exercism.
class Atbash
  class << self
    def encode(string)
      add_spaces(coding(string))
    end

    def decode(string)
      coding(string)
    end

    private

    def coding(code)
      code.downcase.chars.map do |char|
        CIPHER[char]
      end.join
    end

    def add_spaces(string)
      new_string = ''
      until string.nil? || string.empty?
        five = string.chars.take(5)
        new_string = "#{new_string}#{five.join} "
        string = string[5..string.length]
      end

      new_string.strip
    end
  end

  CIPHER = {
    'a' => 'z',
    'b' => 'y',
    'c' => 'x',
    'd' => 'w',
    'e' => 'v',
    'f' => 'u',
    'g' => 't',
    'h' => 's',
    'i' => 'r',
    'j' => 'q',
    'k' => 'p',
    'l' => 'o',
    'm' => 'n',
    'n' => 'm',
    'o' => 'l',
    'p' => 'k',
    'q' => 'j',
    'r' => 'i',
    's' => 'h',
    't' => 'g',
    'u' => 'f',
    'v' => 'e',
    'w' => 'd',
    'x' => 'c',
    'y' => 'b',
    'z' => 'a',
    '1' => '1',
    '2' => '2',
    '3' => '3',
    '4' => '4',
    '5' => '5',
    '6' => '6',
    '7' => '7',
    '8' => '8',
    '9' => '9',
    '0' => '0'
  }.freeze

  private_constant :CIPHER
end
