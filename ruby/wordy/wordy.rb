# frozen_string_literal: true

class WordProblem
  def initialize(question)
    @question = question.chop
  end

  def answer
    operation = @question.split[2..@question.length]

    numbers = [operation.first.to_i, operation.last.to_i]

    case operation[1]
    when 'plus'
      numbers.first + numbers.last
    when 'minus'
      numbers.first - numbers.last
    else
      0
    end
  end
end
