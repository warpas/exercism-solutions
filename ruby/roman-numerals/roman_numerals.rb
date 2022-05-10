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

    ten_plus = less_than_fifty / 10
    if ten_plus >= 4
      roman_numeral += 'XL'
    else
      roman_numeral += 'X' * ten_plus
    end
    last_digit = less_than_fifty % 10

    return roman_numeral + 'IX' if last_digit == 9
    return roman_numeral + 'IV' if last_digit == 4

    five = last_digit / 5
    roman_numeral += 'V' if five.positive?
    last_five = last_digit % 5

    roman_numeral += 'I' * last_five
    roman_numeral
  end
end
