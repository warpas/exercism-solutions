class Phrase
  def initialize(phrase)
    @words = phrase.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    @words.each_with_object(Hash.new(0)) do |word, hash|
      hash[word] += 1
    end
  end
end
