# frozen_string_literal: true

# Implementation of the Bowling exercise in Ruby track on Exercism.
class Game
  def initialize
    puts ""
    @rewrite = Rewrite.new
  end

  def roll(pins_knocked_down)
    @rewrite.roll(pins_knocked_down)
  end

  def score
    rewrite_score = @rewrite.final_score
    puts "rewrite scores: #{rewrite_score}"
    rewrite_score
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
