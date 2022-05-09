class Integer
  def to_roman
    roman_numeral = ''

    ten_plus = self / 10

    roman_numeral += 'X' * ten_plus

    last_digit = self % 10

    return 'IX' if last_digit == 9
    return 'IV' if last_digit == 4

    five = last_digit / 5

    roman_numeral += 'V' if five.positive?

    last_five = last_digit % 5

    return 'VI' if last_digit == 6
    return 'V' if last_digit == 5

    roman_numeral += 'I' * last_five
    roman_numeral
  end
end
