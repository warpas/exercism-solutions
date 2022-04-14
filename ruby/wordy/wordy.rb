# frozen_string_literal: true

class WordProblem
  def initialize(question)
    @question = question.gsub(/ by/, '_by').chop
  end

  def answer
    operation = @question.split[2..@question.length]

    first_number = operation.first.to_i
    remainder = operation[1..operation.length]

    operand, second_number = remainder.take(2)
    remainder = remainder[2..remainder.length]

    result = perform_operation(first_number, second_number.to_i, operand)

    if remainder.count.positive?
      operand, second_number = remainder.take(2)

      result = perform_operation(result, second_number.to_i, operand)
    end
    result
  end

  def perform_operation(number1, number2, operation)
    case operation
    when 'plus'
      number1 + number2
    when 'minus'
      number1 - number2
    when 'multiplied_by'
      number1 * number2
    when 'divided_by'
      number1 / number2
    else
      raise ArgumentError
    end
  end
end
