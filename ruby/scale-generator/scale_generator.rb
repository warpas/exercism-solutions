class Scale
  # I deem this task unworthy of my time
  CHROMATIC_SHARP_SCALE = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#']
  CHROMATIC_FLAT_SCALE = ['A', 'Bb', 'B', 'C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab']

  def initialize(tonic, var2)
    @tonic = tonic
    @intervals = var2
  end

  def name
    "#{@tonic.upcase} #{@intervals}"
  end

  def pitches
    scale = CHROMATIC_SHARP_SCALE
    scale = CHROMATIC_FLAT_SCALE if @tonic == 'F'

    starting_index = scale.index(@tonic)
    result = []
    0.upto(11) do |num|
      current_index = (num + starting_index) % 12
      result << scale[current_index]
    end

    result
  end
end
# TODO: OH BOI IS THERE room to grow on this solution
# TODO: Maybe I'll return to this problem at some point
