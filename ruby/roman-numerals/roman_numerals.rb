class Integer
  def to_roman
    roman_numeral = ''

    thousand = self / 1000
    roman_numeral += 'M' * thousand if thousand.positive?
    less_than_thousand = self % 1000

    five_hundred = less_than_thousand / 500
    less_than_five_hundred = less_than_thousand % 500
    if less_than_thousand >= 900
      roman_numeral += 'CM'
      less_than_five_hundred = less_than_thousand % 900
    elsif five_hundred.positive?
      roman_numeral += 'D'
    end

    hundred = less_than_five_hundred / 100
    less_than_hundred = less_than_five_hundred % 100
    if less_than_five_hundred >= 400
      roman_numeral += 'CD'
    elsif hundred.positive?
      roman_numeral += 'C'
    end

    fifty = less_than_hundred / 50
    less_than_fifty = less_than_hundred % 50
    if less_than_hundred >= 90
      roman_numeral += 'XC'
      less_than_fifty = less_than_hundred % 90
    elsif fifty.positive?
      roman_numeral += 'L'
    end

    to_roman, last_digit = roman_part(less_than_fifty, 'X', 10)
    roman_numeral += to_roman

    # ten_plus = less_than_fifty / 10
    # if ten_plus >= 4
    #   roman_numeral += 'XL'
    # else
    #   roman_numeral += 'X' * ten_plus
    # end
    # last_digit = less_than_fifty % 10

    return roman_numeral + 'IX' if last_digit == 9
    return roman_numeral + 'IV' if last_digit == 4


    to_roman, last_five = roman_part(last_digit, 'V', 5)
    # five = last_digit / 5
    # roman_numeral += 'V' if five.positive?
    # last_five = last_digit % 5

    roman_numeral += to_roman
    roman_numeral += 'I' * last_five
    roman_numeral
  end

  private

  def roman_part(number_to_convert, symbol, limit)
    roman_addition = ''
    five = number_to_convert / limit
    leftover_number = number_to_convert % limit
    # p five
    # if leftover_number >= number_to_convert - 1
    if five >= 4
      roman_addition += 'XL'
    elsif five.positive?
      roman_addition += symbol * five
    end
    # roman_addition += symbol if five.positive?

    [roman_addition, leftover_number]
  end
end
