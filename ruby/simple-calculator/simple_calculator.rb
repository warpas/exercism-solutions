# frozen_string_literal: true

# Implementation of the Simple Calculator exercise in Ruby track on Exercism.
class SimpleCalculator
  # Error type for unsupported operation given to the calculator
  class UnsupportedOperation < StandardError; end

  # @param first_operand [Integer]
  # @param second_operand [Integer]
  # @param operator [String]
  # @raise [UnsupportedOperation] if the operator is unsupported
  # @raise [ArgumentError] if one of the operands is not an Integer
  # @return [String] fully written out expression with an evaluated result
  def self.calculate(first_operand, second_operand, operator)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include? operator
    raise ArgumentError if first_operand.is_a?(String) || second_operand.is_a?(String)

    begin
      "#{first_operand} #{operator} #{second_operand} = #{first_operand.send(operator, second_operand)}"
    rescue ZeroDivisionError
      'Division by zero is not allowed.'
    end
  end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  private_constant :ALLOWED_OPERATIONS
end
