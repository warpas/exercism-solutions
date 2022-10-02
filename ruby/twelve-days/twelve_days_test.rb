require 'minitest/autorun'
require_relative 'twelve_days'

class TwelveDaysTest < Minitest::Test
  def test_the_whole_song
    song_file = File.expand_path('song.txt', __dir__)
    expected = IO.read(song_file)
    assert_equal expected, TwelveDays.song
  end

  def test_the_first_verse
    expected = 'On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.'
    assert_equal expected, TwelveDays.verse(1)
  end

  def test_the_second_verse
    expected = 'On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.'
    assert_equal expected, TwelveDays.verse(2)
  end

  def test_the_third_verse
    expected = 'On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    assert_equal expected, TwelveDays.verse(3)
  end

  def test_the_fourth_verse
    expected = 'On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    assert_equal expected, TwelveDays.verse(4)
  end

  def test_the_fifth_verse
    expected = 'On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    assert_equal expected, TwelveDays.verse(5)
  end

  def test_the_sixth_verse
    expected = 'On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    assert_equal expected, TwelveDays.verse(6)
  end

  def test_the_seventh_verse
    expected = 'On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    assert_equal expected, TwelveDays.verse(7)
  end
end
