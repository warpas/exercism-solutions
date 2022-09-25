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
end
