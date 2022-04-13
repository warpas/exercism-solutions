class WordProblem
  def initialize(question)
    @question = question
  end

  def answer
    numbers = []
    @question.gsub(/\d+/) do |number|
      numbers << number.to_i
    end
    # p numbers
    numbers.sum
  end
end
