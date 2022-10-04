# frozen_string_literal: true

# Implementation of the TwelveDays exercise in Ruby track on Exercism.
class TwelveDays
  class << self
    def song
      verses = []
      1.upto(12) do |day|
        verses << verse(day)
      end

      verses.join("\n")
    end

    def verse(number)
      component = MAPPING[number]
      gifts = []
      1.upto(number) do |day|
        gift =
          if number > 1 && day == 1
            "and #{MAPPING[day][:gift]}"
          else
            MAPPING[day][:gift]
          end
        gifts.push gift
      end

      output_gifts = gifts.reverse.join(', ')
      "On the #{component[:count]} day of Christmas my true love gave to me: #{output_gifts}.\n"
    end

    MAPPING = {
      1 => { count: 'first', gift: 'a Partridge in a Pear Tree' },
      2 => { count: 'second', gift: 'two Turtle Doves' },
      3 => { count: 'third', gift: 'three French Hens' },
      4 => { count: 'fourth', gift: 'four Calling Birds' },
      5 => { count: 'fifth', gift: 'five Gold Rings' },
      6 => { count: 'sixth', gift: 'six Geese-a-Laying' },
      7 => { count: 'seventh', gift: 'seven Swans-a-Swimming' },
      8 => { count: 'eighth', gift: 'eight Maids-a-Milking' },
      9 => { count: 'ninth', gift: 'nine Ladies Dancing' },
      10 => { count: 'tenth', gift: 'ten Lords-a-Leaping' },
      11 => { count: 'eleventh', gift: 'eleven Pipers Piping' },
      12 => { count: 'twelfth', gift: 'twelve Drummers Drumming' }
    }.freeze
  end
end
