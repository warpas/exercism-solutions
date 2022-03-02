# frozen_string_literal: true

# Implementation of the Two Bucket exercise in Ruby track on Exercism.
class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(size1, size2, goal, start_with)
    @size1 = size1
    @size2 = size2
    @goal = goal
    @start_with = start_with

    @other_bucket = 0
    @visited_states = []
    @goal_reached = false
    @queue = PotentialMovesQueue.new

    perform_acrobatics
  end

  class PotentialMovesQueue
    def initialize
      @queue = []
    end

    def add(element)
      @queue << element
    end

    def length
      @queue.length
    end

    def empty?
      @queue.empty?
    end

    def take_first
      @queue.shift
    end
  end

  class BucketState
    attr_reader :moves

    def initialize(bucket1, bucket2, moves)
      @bucket1 = bucket1
      @bucket2 = bucket2
      @moves = moves
    end

    def to_s
      "#{@bucket1},#{@bucket2}"
    end

    def reached?(goal)
      [@bucket1, @bucket2].include? goal
    end

    def other(goal)
      return @bucket2 if goal == @bucket1
      return @bucket1 if goal == @bucket2

      -1
    end

    def goal_bucket(goal)
      return 'one' if goal == @bucket1
      return 'two' if goal == @bucket2

      'none'
    end

    def empty_bucket_one
      bucket1_after_pouring = 0
      bucket2_after_pouring = @bucket2
      BucketState.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end

    def empty_bucket_two
      bucket1_after_pouring = @bucket1
      bucket2_after_pouring = 0
      BucketState.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end

    def fill_bucket_one(size)
      bucket1_after_pouring = size
      bucket2_after_pouring = @bucket2
      BucketState.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end

    def fill_bucket_two(size)
      bucket1_after_pouring = @bucket1
      bucket2_after_pouring = size
      BucketState.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end

    def pour_from_bucket_one_to_bucket_two(size)
      sum_of_buckets = @bucket1 + @bucket2
      overflow_amount = sum_of_buckets - size
      bucket1_after_pouring = [overflow_amount, 0].max
      bucket2_after_pouring = [sum_of_buckets, size].min
      BucketState.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end

    def pour_from_bucket_two_to_bucket_one(size)
      sum_of_buckets = @bucket1 + @bucket2
      overflow_amount = sum_of_buckets - size
      bucket1_after_pouring = [sum_of_buckets, size].min
      bucket2_after_pouring = [overflow_amount, 0].max
      BucketState.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end
  end

  private

  def perform_acrobatics
    @moves = 0
    empty_buckets
    make_initial_step
    move_towards_goal until goal_reached
    determine_other_bucket
    determine_goal_bucket
  end

  def determine_other_bucket
    @other_bucket = @visited_states.last.other(@goal)
  end

  def determine_goal_bucket
    @goal_bucket = @visited_states.last.goal_bucket(@goal)
  end

  attr_reader :goal_reached

  def empty_buckets
    @visited_states << BucketState.new(0, 0, @moves)
    @moves += 1
  end

  def make_initial_step
    current_state = fill_starting_bucket
    @goal_reached = current_state.reached?(@goal)
    add_valid_moves_to_queue_for(current_state)
  end

  def take_a_step(state)
    @visited_states << state
    @goal_reached = state.reached?(@goal)
    add_valid_moves_to_queue_for(state)
  end

  def fill_starting_bucket
    new_state =
      if @start_with == 'one'
        @visited_states << BucketState.new(0, @size2, 0)
        BucketState.new(@size1, 0, @moves)
      else
        @visited_states << BucketState.new(@size1, 0, 0)
        BucketState.new(0, @size2, @moves)
      end
    @visited_states << new_state
    new_state
  end

  def add_valid_moves_to_queue_for(state)
    @queue.add(state.empty_bucket_one)
    @queue.add(state.empty_bucket_two)
    @queue.add(state.fill_bucket_one(@size1))
    @queue.add(state.fill_bucket_two(@size2))
    @queue.add(state.pour_from_bucket_one_to_bucket_two(@size2))
    @queue.add(state.pour_from_bucket_two_to_bucket_one(@size1))
  end

  def move_towards_goal
    perform_valid_moves

    @goal_reached = true if @moves > 105
  end

  def perform_valid_moves
    state = @queue.take_first
    visited_state = did_we_visit_this_state_already?(state)
    @moves = state.moves
    return if visited_state

    take_a_step(state)
  end

  def did_we_visit_this_state_already?(state)
    visited_already = false
    @visited_states.each do |visited_state|
      visited_already = true if visited_state.to_s == state.to_s
    end
    visited_already
  end
end
