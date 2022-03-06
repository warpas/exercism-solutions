# frozen_string_literal: true

# Implementation of the Two Bucket exercise in Ruby track on Exercism.
class TwoBucket
  def initialize(size1, size2, goal, start_with)
    @size1 = size1
    @size2 = size2
    @goal = goal
    @start_with = start_with

    @moves_count = 0
    @goal_reached = false

    @visited_states = VisitedStates.new
    @potential_moves = QueuedMoves.new
    empty_buckets
  end

  def moves
    find_goal unless @goal_reached

    @moves_count
  end

  def goal_bucket
    find_goal unless @goal_reached

    @goal_bucket
  end

  def other_bucket
    find_goal unless @goal_reached

    @other_bucket
  end

  private

  class BucketState
    attr_reader :moves

    def initialize(bucket1, bucket2, moves)
      @bucket1 = bucket1
      @bucket2 = bucket2
      @moves = moves
    end

    def same_state_as(state)
      to_s == state.to_s
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
      bucket1_emptied = 0
      bucket2_unchanged = @bucket2
      BucketState.new(bucket1_emptied, bucket2_unchanged, @moves + 1)
    end

    def empty_bucket_two
      bucket1_unchanged = @bucket1
      bucket2_emptied = 0
      BucketState.new(bucket1_unchanged, bucket2_emptied, @moves + 1)
    end

    def fill_bucket_one(size)
      bucket1_filled = size
      bucket2_unchanged = @bucket2
      BucketState.new(bucket1_filled, bucket2_unchanged, @moves + 1)
    end

    def fill_bucket_two(size)
      bucket1_unchanged = @bucket1
      bucket2_filled = size
      BucketState.new(bucket1_unchanged, bucket2_filled, @moves + 1)
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

  def find_goal
    fill_starting_bucket
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
    @visited_states.add BucketState.new(0, 0, @moves_count)
    @moves_count += 1
  end

  def take_a_step(state)
    @moves_count = state.moves
    return if visited?(state)

    @visited_states.add state
    @goal_reached = state.reached?(@goal)
    add_valid_moves_to_queue_for(state)
  end

  def fill_starting_bucket
    new_state =
      if @start_with == 'one'
        @visited_states.add BucketState.new(0, @size2, 0)
        BucketState.new(@size1, 0, @moves_count)
      else
        @visited_states.add BucketState.new(@size1, 0, 0)
        BucketState.new(0, @size2, @moves_count)
      end
    take_a_step(new_state)
  end

  def add_valid_moves_to_queue_for(state)
    @potential_moves.add(state.empty_bucket_one)
    @potential_moves.add(state.empty_bucket_two)
    @potential_moves.add(state.fill_bucket_one(@size1))
    @potential_moves.add(state.fill_bucket_two(@size2))
    @potential_moves.add(state.pour_from_bucket_one_to_bucket_two(@size2))
    @potential_moves.add(state.pour_from_bucket_two_to_bucket_one(@size1))
  end

  def move_towards_goal
    state = @potential_moves.take_next
    take_a_step(state)
  end

  def visited?(state)
    @visited_states.include?(state)
  end

  class QueuedMoves
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

    def take_next
      @queue.shift
    end
  end

  class VisitedStates
    def initialize
      @visited = []
    end

    def add(state)
      @visited << state
    end

    def include?(state)
      @visited.each do |visited_state|
        return true if state.same_state_as(visited_state)
      end

      false
    end

    def last
      @visited.last
    end
  end

  private_constant :QueuedMoves
  private_constant :VisitedStates
  private_constant :BucketState
end
