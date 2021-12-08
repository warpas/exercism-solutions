class Isogram
  ALLOWED_DUPLICATES = ['-', ' '].freeze

  def self.isogram?(string)
    letters = string.downcase.chars - ALLOWED_DUPLICATES
    letters == letters.uniq
  end
end
