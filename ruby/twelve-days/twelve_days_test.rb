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

  def test_the_thirst_verse
    expected = 'On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.'
    assert_equal expected, TwelveDays.verse(3)
  end
end
