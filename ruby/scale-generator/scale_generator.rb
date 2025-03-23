class Scale
  CHROMATIC_SHARP_SCALE = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#']
  CHROMATIC_FLAT_SCALE = ['A', 'Bb', 'B', 'C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab']

  def initialize(tonic, intervals, steps='')
    if tonic.length > 1
      @tonic = "#{tonic[0].upcase}#{tonic[1]}"
      if tonic[1] == '#'
        @scale = CHROMATIC_SHARP_SCALE
      else
        @scale = CHROMATIC_FLAT_SCALE
      end
    else
      @scale = CHROMATIC_SHARP_SCALE
      @tonic = tonic.upcase
    end
    # TODO: intervals should be renamed to something more descriptive
    @intervals = intervals
    @steps = steps
  end

  def name
    "#{@tonic} #{@intervals}"
  end

  def pitches
    @scale ||= CHROMATIC_SHARP_SCALE
    @scale = CHROMATIC_FLAT_SCALE if @tonic == 'F'
    @scale = CHROMATIC_FLAT_SCALE if @intervals == :locrian

    starting_index = @scale.index(@tonic)
    result = []

    # puts ''
    # p @steps unless @steps.empty?
    next_step = 0
    current_step = 0
    last_step = starting_index
    current_index = (last_step + next_step) % 12
    new_element = @scale[current_index]
    while(!result.include?(new_element)) do
      # p "new_element: #{new_element}, current_index: #{current_index}" unless @steps.empty?
      last_step += next_step
      next_step = @steps[current_step] == 'M' ? 2 : 1
      current_step += 1
      result << new_element
      current_index = (last_step + next_step) % 12
      new_element = @scale[current_index]
    end

    result
  end
end
# TODO: OH BOI IS THERE room to grow on this solution
