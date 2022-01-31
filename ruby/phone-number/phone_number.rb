# frozen_string_literal: true

# Implementation of the Phone Number exercise in Ruby track on Exercism.
class PhoneNumber
  # @param raw_phone_number [String]
  # @return [String, nil]
  def self.clean(raw_phone_number)
    new(raw_phone_number).validate
  end

  # @return [String, nil]
  def validate
    return nil unless valid?

    number
  end

  private

  attr_reader :number

  def valid?
    area_code = number[0]
    exchange_code = number[3]
    number.length == 10 && !bad_code(area_code) && !bad_code(exchange_code)
  end

  def initialize(raw_number)
    @number = raw_number.scan(/\d+/).join
    @number = @number[1..10] if longer_with_good_start
  end

  def longer_with_good_start
    number.length > 10 && number[0] == '1'
  end

  def bad_code(code)
    %w[0 1].include?(code)
  end
end
