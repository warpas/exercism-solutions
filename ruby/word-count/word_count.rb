class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.split(/'*[.:,!&@$%^\s]+'*/)

    hash = {}
    words.each do |mix_case_word|
      word = mix_case_word.downcase
      if word.empty?
      else
        hash[word].nil? ? hash[word] = 1 : hash[word] += 1
      end
    end
    hash
  end
end
