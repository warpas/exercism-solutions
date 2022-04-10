class BeerSong
  class << self
    def recite(start, verses)
      song = ''
      verses.times do
        song += sing(start)
        start -= 1
      end

      song.strip + "\n"
    end

    private

    def sing(start)
      "#{bottles(start).capitalize} of beer on the wall, #{bottles(start)} of beer.
#{do_x_with(start)}, #{bottles(start - 1)} of beer on the wall.

"
    end

    def bottles(count)
      return '99 bottles' if count == -1
      return 'no more bottles' if count == 0
      return "#{count} bottle" if count == 1

      "#{count} bottles"
    end

    def do_x_with(count)
      return 'Go to the store and buy some more' if count == 0

      "Take #{count == 1 ? 'it' : 'one'} down and pass it around"
    end
  end
end
