class Game
  def initialize
    @score = 0
    @last_throw = 0
    # @spare_recorded = false
    @frame = Frame.new
    @frames_collection = FrameCollection.new
  end

  def roll(pins_knocked_down)
    @frames_collection.add(@frame)
    @score += pins_knocked_down if strike?
    @frame = @frame.roll(pins_knocked_down)
    @frames_collection.add(@frame)
    @frames_collection.prune
    # puts "frame formulated"
    @score += pins_knocked_down if (spare? && @frame.throws == 1 && !(@frame.count == 11))

    # @spare_recorded = spare?(pins_knocked_down)
    # puts "@spare_recorded = #{@spare_recorded}"
    @last_throw = pins_knocked_down
    @score += pins_knocked_down
    # puts "@frame = #{@frame}"
    # puts "@frames_collection = #{@frames_collection}"
    # puts "@frames_collection.length = #{@frames_collection.count}"
    # puts "@frame.show = #{@frame.show}"
    # puts "score = #{@score}"
  end

  def score
    puts ''
    scores = @frames_collection.calculate_scores
    puts "calculated_scores = #{scores}"
    puts "@frames_collection = #{@frames_collection.display}"
    puts "total score returned: #{@score}"
    @score
  end

  private

  def spare?#(new_throw)
    @frame.spare
  end

  def strike?#(new_throw)
    @frame.strike
  end
end

class Frame
  attr_reader :count, :spare, :strike, :score
  # def initialize
  #   # @throw_one = -1
  #   # @throw_two = -1
  # end

  def initialize(count = 1, th1 = -1, th2 = -1, spare = false, strike = false)
    @count = count
    @throw_one = th1
    @throw_two = th2
    @spare = spare
    @strike = strike
    @score = 0
  end

  def roll(pins)
    # puts "st"
    if @throw_one == -1 && pins == 10
      Frame.new(@count + 1, -1, -1, @spare, true)
    elsif @throw_one == -1
      # puts "throw one"
      # self.throw_one = pins
      # puts "what is spare here? #{@spare}"
      Frame.new(@count, pins, -1, @spare, @strike)
    elsif @throw_two == -1
      # puts "throw two"
      # self.throw_two = pins
      Frame.new(@count, @throw_one, pins, @spare, @strike)
    elsif @throw_one + @throw_two == 10
      # puts "SPARE SHOULD BE TRUE AFTER"
      Frame.new(@count + 1, -1, -1, true).roll(pins)
    else
      # puts "new frame"
      Frame.new(@count + 1).roll(pins)
    end
    # pins
  end

  def throws
    if @throw_one == -1
      0
    elsif @throw_two == -1
      1
    else
      2
    end
  end

  def throw_one=(pins)
    # puts "assignment to throw_one"
    @throw_one = pins
    Frame.new(pins, -1)
  end

  def throw_two=(pins)
    # puts "assignment to throw_two"
    @throw_two = pins
    Frame.new(@throw_one, pins)
  end

  def calulate_score
    # TODO: skip -1s and do a lot more 😁
    @score += @throw_one if @throw_one.positive?
    @score += @throw_two if @throw_two.positive?
  end

  def show
    [@count, @throw_one, @throw_two, "spare #{@spare}", "strike #{@strike}", "frame_score: #{@score}"]
  end
end

class FrameCollection
  def initialize
    @all = []
    @pruned = []
  end

  def add(frame)
    # puts "inside #add"
    duplicate_frames = @pruned.select do |elem|
      # puts "elem = #{elem}"
      # puts "elem.count = #{elem.count}"
      # puts "frame = #{frame}"
      # puts "frame.count = #{frame.count}"
      frame.count == elem.count
    end

    if duplicate_frames.empty?
      @pruned << frame
    else
      replace(duplicate_frames.first, frame)
    end

    @all << frame
  end

  def replace(old_frame, new_frame)
    @pruned.delete(old_frame)
    @pruned << new_frame
  end

  def prune
    @all.each_with_index do |frame, index|
      # puts "frame is #{frame}"
      # puts "index is #{index}"
      # puts "index is #{index}, count is #{frame.count}"
      # puts "index + 1 is #{index + 1}, count is #{frame.count}"
    end
  end

  def count
    # @all.length
    @pruned.length
  end

  def calculate_scores
    scores = []
    @pruned.each do |frame|
      frame.calulate_score
      puts "frame.score = #{frame.score}"
      scores << frame.score
    end
    scores
  end

  def display
    # @all.map { |frame| frame.count }
    @pruned.map { |frame| frame.show }
  end
end
