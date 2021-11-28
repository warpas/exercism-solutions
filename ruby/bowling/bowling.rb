class Game
  def initialize
    @score = 0
    @last_throw = 0
    # @spare_recorded = false
    @frame = Frame.new
  end

  def roll(pins_knocked_down)
    @frame = @frame.roll(pins_knocked_down)
    puts "frame formulated"
    @score += pins_knocked_down if (spare? && @frame.throws == 1 && !(@frame.count == 11))
    puts "we've got a strike situation" if strike?

    # @spare_recorded = spare?(pins_knocked_down)
    # puts "@spare_recorded = #{@spare_recorded}"
    @last_throw = pins_knocked_down
    @score += pins_knocked_down
    # puts "@frame = #{@frame}"
    puts "@frame.show = #{@frame.show}"
    puts "score = #{@score}"
  end

  def score
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
  attr_reader :count, :spare, :strike
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
    puts "assignment to throw_one"
    @throw_one = pins
    Frame.new(pins, -1)
  end

  def throw_two=(pins)
    puts "assignment to throw_two"
    @throw_two = pins
    Frame.new(@throw_one, pins)
  end

  def show
    [@count, @throw_one, @throw_two, "spare #{@spare}", "strike #{@strike}"]
  end
end
