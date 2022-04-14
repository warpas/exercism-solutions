# frozen_string_literal: true

# Implementation of the Wordy exercise in Ruby track on Exercism.
class WordProblem
  def initialize(question)
    @question = question.gsub(/ by/, '_by').chop
  end

  def answer
    terms = @question.split[2..@question.length]

    result = terms.first
    terms = terms[1..terms.length]

    until terms.empty?
      operand, second_number = terms.take(2)
      terms = terms[2..terms.length]
      result = calculate(result, second_number, operand)
    end

    result
  end

  private

  ALLOWED_OPERATIONS = { 'plus' => '+', 'minus' => '-', 'multiplied_by' => '*', 'divided_by' => '/' }.freeze
  private_constant :ALLOWED_OPERATIONS

  def calculate(number1, number2, operator)
    raise ArgumentError unless ALLOWED_OPERATIONS.keys.include? operator

    number1.to_i.send(ALLOWED_OPERATIONS[operator], number2.to_i)
  end
end
