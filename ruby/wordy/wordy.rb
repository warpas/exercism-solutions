# frozen_string_literal: true

# Implementation of the Wordy exercise in Ruby track on Exercism.
class WordProblem
  # @param question [String] in a form of "What is A plus B multiplied by C?"
  def initialize(question)
    @question = question.gsub(/ by/, '_by').chop
  end

  # @raise [ArgumentError] if one of the operators does not correspond with the list of ALLOWED_OPERATIONS
  # @return [Integer] parsed and calculated answer to the initial question
  def answer
    _, _, result, *terms = @question.split

    until terms.empty?
      operand, second_number, *terms = terms
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
