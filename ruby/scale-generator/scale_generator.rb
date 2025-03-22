class Scale
  # I deem this task unworthy of my time
  CHROMATIC_SHARP_SCALE = ['A', 'A#', 'B', 'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#']
  CHROMATIC_FLAT_SCALE = ['A', 'Bb', 'B', 'C', 'Db', 'D', 'Eb', 'E', 'F', 'Gb', 'G', 'Ab']

  def initialize(tonic, intervals, steps='')
    @tonic = tonic.upcase
    @intervals = intervals
    @steps = steps
  end

  def name
    "#{@tonic} #{@intervals}"
  end

  def pitches
    scale = CHROMATIC_SHARP_SCALE
    scale = CHROMATIC_FLAT_SCALE if @tonic == 'F'

    starting_index = scale.index(@tonic)
    result = []

    # if @steps.empty?
    #   0.upto(11) do |num|
    #     current_index = (num + starting_index) % 12
    #     new_element = scale[current_index]
    #     result << new_element
    #   end
    # else
      # puts ''
      # p @steps unless @steps.empty?
      next_step = 0
      current_step = 0
      last_step = starting_index
      current_index = (last_step + next_step) % 12
      new_element = scale[current_index]
      while(!result.include?(new_element)) do
        # p "new_element: #{new_element}, current_index: #{current_index}" unless @steps.empty?
        last_step += next_step
        next_step = @steps[current_step] == 'M' ? 2 : 1
        current_step += 1
        result << new_element
        current_index = (last_step + next_step) % 12
        new_element = scale[current_index]
      end
    # end

    result
  end
end
# TODO: OH BOI IS THERE room to grow on this solution
