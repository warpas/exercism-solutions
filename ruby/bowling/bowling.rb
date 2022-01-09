# frozen_string_literal: true

# Implementation of the Bowling exercise in Ruby track on Exercism.
class Game
  def initialize
    puts ""
    @score = 0
    @last_throw = 0
    # @spare_recorded = false
    @frame = Frame.new
    @frames_collection = FrameCollection.new
    @rewrite = Rewrite.new
  end

  def roll(pins_knocked_down)
    @rewrite.roll(pins_knocked_down)
    @frames_collection.add(@frame)
    if strike?
      @score += pins_knocked_down
    end
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
    scores = @frames_collection.calculate_scores
    scores_plus = @frames_collection.calculate_scores_hash
    puts ''
    # puts "@frames_collection = #{@frames_collection.display}"

    # puts "@frames_collection:"
    # puts @frames_collection.display_hash

    # puts "calculated_scores = #{scores}"
    # puts "sum of calculated_scores = #{scores.sum}"
    # puts "calculated_scores [hash] = #{scores_plus}"
    # puts "sum of calculated_scores [hash] = #{scores_plus.sum}"
    updated = @frames_collection.single_scores
    # puts "updated_scores [hash] = #{updated}"

    rewrite_score = @rewrite.final_score
    puts "first score: #{@score}"
    puts "hash scores: #{updated.sum}"
    puts "rewrite scores: #{rewrite_score}"
    # @score
    # updated.sum
    rewrite_score
  end

  private

  def spare?#(new_throw)
    @frame.spare
  end

  def strike?#(new_throw)
    @frame.strike
  end
end

class Rewrite
  def initialize
    a0 = RollZero.new
    # p a0
    @roll_log = GameLog.new
    @roll_log.add(a0.frame_number, a0)
  end

  def roll(pins_knocked_down)
    total_roll_number = @roll_log.last_roll_number
    nr = NextRoll.new(pins: pins_knocked_down, total_roll_number: total_roll_number)
    # p nr
    @roll_log.add(total_roll_number, nr)
  end

  def final_score
    @roll_log.final_score
    # 300
  end

  class GameLog
    attr_reader :log

    def initialize
      @log = {}
      @frame = CurrentFrame.new
    end

    def last_roll_number
      log.count
    end

    def add(index, roll_details)
      next_frame if next_frame_condition_fulfilled(index)
      # puts "@log = #{log.inspect}"
      # puts "index = #{index}"
      # @frame.add(roll_details)
      # p @frame.number
      roll_details.frame_number = @frame.number
      add_roll_to_frame(roll_details)
      # p @frame
      # puts '-----'

      roll_details.update_spare_and_strike(@frame) if spare_or_strike?
      # puts "roll_details = #{roll_details.inspect}"
      # p log[index-1].frame_number if index.positive?
      log[index] = roll_details
    end

    def final_score
      # puts "@log = #{log.inspect}"
      spares = log.values.select { |roll| roll.spare_trigger == true }
      # p spares
      spares.each do |spare|
        next_roll = log[spare.total_roll_number + 1]
        # p next_roll.pins
        spare.add_to_score(next_roll.pins) if !next_roll.nil? && next_roll.frame_number != 11
      end

      strikes = log.values.select { |roll| roll.strike_trigger == true }
      # p strikes
      strikes.each do |strike|
        next_roll1 = log[strike.total_roll_number + 1]
        next_roll2 = log[strike.total_roll_number + 2]
        # p next_roll1.pins
        # p next_roll2.pins
        strike.add_to_score(next_roll1.pins) if !next_roll1.nil? && next_roll1.frame_number != 11
        strike.add_to_score(next_roll2.pins) if !next_roll2.nil? && next_roll2.frame_number != 11
      end
      log.values.map(&:score).sum
    end

    private

    def next_frame_condition_fulfilled(index)
      (@frame.number.zero? && index.positive?) || @frame.filled
    end

    def next_frame
      last_frame_number = @frame.number
      @frame = CurrentFrame.new(number: last_frame_number + 1)
    end

    def add_roll_to_frame(roll)
      @frame.add(roll)
    end

    def spare_or_strike?
      @frame.spare_or_strike?
    end
  end

  class Roll
    attr_accessor :frame_number, :spare_trigger, :strike_trigger
    attr_reader :total_roll_number, :pins
    # attr_writer :strike_trigger

    def initialize(pins:, total_roll_number: 1)
      # puts "inside Roll.initialize"
      @pins = pins
      @frame_number = 0
      @total_roll_number = total_roll_number
      @score = 0
      @spare_trigger = false
      @strike_trigger = false
    end

    # def frame_number=(value)
    #   @frame_number = value
    # end

    def update_spare_and_strike(frame)
      # puts 'SPARE OR STRIKE UPDATE INITIATED'
      # p frame
    end

    def add_to_score(bonus)
      base = @score.zero? ? @pins : 0
      # @score = @pins + bonus if @score.zero?
      # puts "@score #{@score} + base #{base} + bonus #{bonus}"

      @score = @score + base + bonus
    end

    def score
      return @pins if @score.zero?

      @score
    end
  end

  class RollZero < Roll
    def initialize(pins: 0, total_roll_number: 0)
      # puts "inside RollZero.initialize"
      # @pins = pins
      # @total_roll_number = total_roll_number
      super
    end
  end

  class NextRoll < Roll
    def initialize(pins:, total_roll_number:)
      # puts "inside NextRoll.initialize"
      @pins = pins
      # @total_roll_number = total_roll_number
      @frame_number = total_roll_number
      # @frame_number = 1
      super(pins: pins, total_roll_number: total_roll_number)
    end
  end

  class CurrentFrame
    attr_reader :spare, :strike, :number

    def initialize(number: 0, spare: false, strike: false)
      @number = number
      @first_roll = RollZero.new
      @second_roll = RollZero.new
      @spare = spare
      @strike = strike
    end

    def add(roll)
      if @first_roll.is_a?(RollZero)
        @first_roll = roll
      else
        @second_roll = roll
      end
    end

    def filled
      !@second_roll.is_a?(RollZero) || spare_or_strike?
    end

    def spare_or_strike?
      condition = score == 10
      spare_or_strike if condition
      condition
    end

    private

    def score
      @first_roll.score + @second_roll.score
    end

    def spare_or_strike
      # puts 'SPARE OR STRIKE DISCOVERED'
      if @second_roll.is_a?(RollZero)
        @strike = true
        @first_roll.strike_trigger = true
      else
        @spare = true
        @second_roll.spare_trigger = true
      end
    end
  end
end

class Frame
  attr_reader :count, :spare, :strike, :carryover, :score, :throw_one, :throw_two
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
    @carryover = false
    @score = 0
  end

  def roll(pins)
    # puts "st"
    if @throw_one == -1 && pins == 10
      # puts "@count = #{@count}"
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
      new_frame = Frame.new(@count + 1, -1, -1, true).roll(pins)
      # @frames_collection.add(new_frame)
      new_frame
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

  def override_score(new_score)
    # puts "override_score: before is #{@score} after is #{new_score}"
    @score = new_score if new_score > @score
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

  def calculate_score
    # TODO: skip -1s and do a lot more 😁
    @score += @throw_one if @throw_one.positive?
    @score += @throw_two if @throw_two.positive?
  end

  def add_spare_to_score
    @score += @throw_one
  end

  def add_spare_to_score_previous(addition)
    @score += addition
  end

  def fill_strikes
    @throw_one = 10 if @throw_one.negative?
  end

  def add_strike_to_score
    @score += @throw_one if @throw_one.positive?
    if @throw_two.positive?
      @score += @throw_two
    else
      # puts "what's in else?"
      # puts "@throw_two = #{@throw_two}"
      @carryover = true
    end
  end

  def add_strike_to_score_first(addition)
    @score += addition
  end

  def add_strike_to_score_second(addition)
    # puts "are we here EVER?"
    # puts "addition = #{addition}"
    # puts "score before = #{@score}"
    @score += addition
    # puts "score after = #{@score}"
  end

  def carry_over_strike
    # 10+10+10+ 0 +10+10+5+ 0 +10+5+3 + 5+3
    # puts "carry_over DONE!"
    # puts "score before = #{@score}"
    @score += @throw_one
    # puts "score after = #{@score}"
  end

  def show
    [@count, @throw_one, @throw_two, "spare #{@spare}", "strike #{@strike}", "co_strike #{@carryover}",  "frame_score: #{@score}"]
  end
end

class FrameCollection
  def initialize
    @all = []
    @pruned = []
    @hash = {}
  end

  def add(frame)
    # puts "inside #add"
    # puts "frame.count = #{frame.count}"
    # puts "frame = #{frame.show}"
    # puts "[ADD] frame.count = frame.count"
    @hash[frame.count] = frame
    # frame.count
    duplicate_frames = @pruned.select do |elem|
      # puts "elem = #{elem}"
      # puts "elem.count = #{elem.count}"
      # puts "frame = #{frame.show}"
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
      frame.calculate_score if frame.score.zero?
      # puts "frame.score = #{frame.score}"
      scores << frame.score
    end
    scores
  end

  def calculate_scores_hash
    @hash.map do |_count, frame|
      frame.fill_strikes
    end

    @hash.map do |count, frame|
      frame.calculate_score if frame.score.zero?
      if frame.spare && count < 10
        @hash[count - 1].add_spare_to_score_previous(frame.throw_one)
      end
      # frame.add_strike_to_score if frame.strike #&& count < 10
      if frame.strike #&& count < 10
        # puts "count - 1 = #{count - 1}"
        # puts "@hash[count - 1] = #{@hash[count - 1]}"

        @hash[count - 1].add_strike_to_score_first(frame.throw_one) unless @hash[count - 1].nil?
      end
      if frame.strike #&& count < 10
        # puts "before if/else"
        if frame.throw_two != -1
          # puts "IN IF frame.throw_two = #{frame.throw_two}"
          @hash[count - 1].add_strike_to_score_second(frame.throw_two) unless @hash[count - 1].nil?
        else
          # puts "IN ELSE frame.throw_two = #{frame.throw_two}"
          @hash[count - 1].add_strike_to_score_second(@hash[count + 1].throw_one) unless @hash[count - 1].nil?
        end
      else
        # puts "we're here!"
      end
      frame.carry_over_strike if frame.carryover
      frame.override_score(10) if !@hash[count + 1].nil? && @hash[count + 1].strike
      # puts "frame.score = #{frame.score}"
      frame.score
    end
  end

  def single_scores
    @hash.map do |_count, frame|
      frame.score
    end
  end

  def display
    # @all.map { |frame| frame.count }
    @pruned.map { |frame| frame.show }
  end

  def display_hash
    # @all.map { |frame| frame.count }
    @hash.map { |key, value| "#{key} => #{value.show}" }
  end
end
