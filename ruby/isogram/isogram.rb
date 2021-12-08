class Isogram
  ALLOWED_DUPLICATES = ['-', ' '].freeze

  def self.isogram?(string)
    hash = Hash.new(0)
    string.downcase.chars do |letter|
      hash[letter] += 1 unless ALLOWED_DUPLICATES.include? letter
      return false if hash[letter] > 1
    end
    true
  end
end
