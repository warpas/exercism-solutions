# frozen_string_literal: true

class WordProblem
  def initialize(question)
    @question = question.gsub(/ by/, '_by').chop
  end

  def answer
    operation = @question.split[2..@question.length]
    p operation

    numbers = [operation.first.to_i, operation.last.to_i]
    first_number = operation.first.to_i
    remainder = operation[1..operation.length]

    p remainder.take(2)
    operand, second_number = remainder.take(2)
    p "operand, second_number = #{operand}, #{second_number}"
    p "operation after take(2) = #{remainder[2..remainder.length]}"
    remainder = remainder[2..remainder.length]

    p operation.find_all { |word| word == 'plus' }
    p operation
    p numbers.first

    result = perform_operation(first_number, second_number.to_i, operand)

    p remainder.count
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
