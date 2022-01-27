# frozen_string_literal: true

# Implementation of the Phone Number exercise in Ruby track on Exercism.
class PhoneNumber
  # @param phone_number [String]
  # @return [String, nil]
  def self.clean(phone_number)
    bare_number = phone_number.scan(/\d+/).join

    return nil if shorter_than_10_digits(bare_number)
    return nil if longer_than_10_digits_bad_start(bare_number)

    bare_number = bare_number[1..10] if longer_than_10_digits_good_start(bare_number)
    return nil if area_code_starts_with_zero(bare_number)
    return nil if area_code_starts_with_one(bare_number)
    return nil if exchange_code_starts_with_zero(bare_number)
    return nil if exchange_code_starts_with_one(bare_number)

    bare_number
  end

  def self.shorter_than_10_digits(bare_number)
    bare_number.length < 10
  end

  def self.longer_than_10_digits_bad_start(bare_number)
    bare_number.length > 10 && bare_number[0] != '1'
  end

  def self.longer_than_10_digits_good_start(bare_number)
    bare_number.length > 10 && bare_number[0] == '1'
  end

  def self.area_code_starts_with_zero(bare_number)
    bare_number.length == 10 && bare_number[0] == '0'
  end

  def self.area_code_starts_with_one(bare_number)
    bare_number.length == 10 && bare_number[0] == '1'
  end

  def self.exchange_code_starts_with_zero(bare_number)
    bare_number.length == 10 && bare_number[3] == '0'
  end

  def self.exchange_code_starts_with_one(bare_number)
    bare_number.length == 10 && bare_number[3] == '1'
  end
end
