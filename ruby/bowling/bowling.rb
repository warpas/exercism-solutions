# frozen_string_literal: true

# Implementation of the Bowling exercise in Ruby track on Exercism.
class Game
  class BowlingError < StandardError; end

  def initialize
    @rewrite = Rewrite.new
  end

  # @param pins_knocked_down [Clock] the number of pins knocked down in the current roll
  # @return [Rewrite::Roll] (to required in the exercise) the Roll object for the current roll
  def roll(pins_knocked_down)
    @rewrite.roll(pins_knocked_down)
  end

  # @return [Integer] the score, which is the sum of points for the entire game
  def score
    @rewrite.final_score
  end
end

class Rewrite
  def initialize
    a0 = RollZero.new
    @roll_log = GameLog.new
    @roll_log.add(a0.frame_number, a0)
  end

  def roll(pins_knocked_down)
    raise Game::BowlingError if pins_knocked_down.negative? || pins_knocked_down > 10

    total_roll_number = @roll_log.last_roll_number
    nr = NextRoll.new(pins: pins_knocked_down, total_roll_number: total_roll_number)
    @roll_log.add(total_roll_number, nr)
  end

  def final_score
    @roll_log.final_score
  end

  class GameLog
    attr_reader :log

    def initialize
      @log = {}
      @frame = CurrentFrame.new
      @frame_not_achieved = false
    end

    def last_roll_number
      log.count
    end

    def add(index, roll_details)
      previous_frame = @frame
      next_frame if next_frame_condition_fulfilled(index)
      if previous_frame.number == 10
        if !(previous_frame.spare || previous_frame.strike)
          raise Game::BowlingError if @frame_not_achieved == true

          @frame_not_achieved = true
        end
      end

      if previous_frame.number == 11
        if !(previous_frame.spare || previous_frame.strike)
          raise Game::BowlingError unless @frame.roll_numbers.first < 21
          raise Game::BowlingError if @frame.number == 12
        end
      end

      roll_details.frame_number = @frame.number
      add_roll_to_frame(roll_details)
      spare_or_strike?
      log[index] = roll_details
    end

    def final_score
      previous_frame = @frame
      raise Game::BowlingError if @frame.number < 10
      raise Game::BowlingError if previous_frame.number == 10 && (previous_frame.spare || previous_frame.strike)

      if previous_frame.number == 11 && previous_frame.strike
        golden_roll_number = @frame.roll_numbers.first - 1
        raise Game::BowlingError if @log[golden_roll_number].strike_trigger
      end

      spares = log.values.select { |roll| roll.spare_trigger == true }
      spares.each do |spare|
        next_roll = log[spare.total_roll_number + 1]
        spare.add_to_score(next_roll.pins) if !next_roll.nil? && spare.frame_number < 10
      end

      strikes = log.values.select { |roll| roll.strike_trigger == true }
      strikes.each do |strike|
        next_roll1 = log[strike.total_roll_number + 1]
        next_roll2 = log[strike.total_roll_number + 2]
        strike.add_to_score(next_roll1.pins) if !next_roll1.nil? && strike.frame_number < 10
        strike.add_to_score(next_roll2.pins) if !next_roll2.nil? && strike.frame_number < 10
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

    def initialize(pins:, total_roll_number: 1)
      @pins = pins
      @frame_number = 0
      @total_roll_number = total_roll_number
      @score = 0
      @spare_trigger = false
      @strike_trigger = false
    end

    def add_to_score(bonus)
      base = @score.zero? ? @pins : 0
      @score = @score + base + bonus
    end

    def score
      return @pins if @score.zero?

      @score
    end
  end

  class RollZero < Roll
    def initialize(pins: 0, total_roll_number: 0)
      super
    end
  end

  class NextRoll < Roll
    def initialize(pins:, total_roll_number:)
      @pins = pins
      @frame_number = total_roll_number
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
        raise Game::BowlingError if @first_roll.pins + roll.pins > 10

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

    def roll_numbers
      [@first_roll.total_roll_number, @second_roll.total_roll_number]
    end

    private

    def score
      @first_roll.score + @second_roll.score
    end

    def spare_or_strike
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
# TODO: OH BOI IS THERE room to grow on this solution
