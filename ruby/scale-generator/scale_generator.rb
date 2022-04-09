class Scale
  # I deem this task unworthy of my time
  SCALE = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#']

  def initialize(var1, var2)
    @var1 = var1
    @var2 = var2
  end

  def name
    'C chromatic'
  end

  def pitches
    return ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"] if @var1 == 'C'

    ["F", "Gb", "G", "Ab", "A", "Bb", "B", "C", "Db", "D", "Eb", "E"]
  end
end
# TODO: OH BOI IS THERE room to grow on this solution
