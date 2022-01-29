# frozen_string_literal: true

# Implementation of the Phone Number exercise in Ruby track on Exercism.
class PhoneNumber
  # @param phone_number [String]
  # @return [String, nil]
  def self.clean(phone_number)
    bare_number = phone_number.scan(/\d+/).join
    bare_number = bare_number[1..10] if longer_than_10_digits_good_start(bare_number)
    return nil unless valid_number?(bare_number)

    bare_number
  end

  def self.bad_code(code)
    %w[0 1].include?(code)
  end

  def self.valid_number?(phone_number)
    area_code = phone_number[0]
    exchange_code = phone_number[3]
    phone_number.length == 10 && !bad_code(area_code) && !bad_code(exchange_code)
  end

  def self.longer_than_10_digits_good_start(bare_number)
    bare_number.length > 10 && bare_number[0] == '1'
  end
end
