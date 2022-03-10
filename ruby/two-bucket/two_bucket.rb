# frozen_string_literal: true

# Implementation of the Two Bucket exercise in Ruby track on Exercism.
class TwoBucket
  def initialize(size1, size2, goal, start_with)
    @size1 = size1
    @size2 = size2
    @goal = goal
    @start_with = start_with
    @goal_reached = false

    @visited_states = VisitedStates.new
    @potential_moves = QueuedMoves.new
    initialize_buckets
  end

  def moves
    find_goal unless goal_reached

    moves_count_to_goal
  end

  def goal_bucket
    find_goal unless goal_reached

    determine_goal_bucket
  end

  def other_bucket
    find_goal unless goal_reached

    determine_other_bucket
  end

  private

  class BucketState
    EMPTY = 0
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

      @bucket1
    end

    def goal_bucket(goal)
      return 'one' if goal == @bucket1

      'two'
    end

    def empty_bucket_one
      empty_bucket('one')
    end

    def empty_bucket_two
      empty_bucket('two')
    end

    def fill_bucket_one(size)
      fill_bucket('one', size)
    end

    def fill_bucket_two(size)
      fill_bucket('two', size)
    end

    def pour_from_bucket_one_to_bucket_two(size)
      pour_from_one_bucket_to_another('one', size)
    end

    def pour_from_bucket_two_to_bucket_one(size)
      pour_from_one_bucket_to_another('two', size)
    end

    private

    def empty_bucket(bucket_label)
      return BucketState.new(EMPTY, @bucket2, moves + 1) if bucket_label == 'one'

      BucketState.new(@bucket1, EMPTY, moves + 1)
    end

    def fill_bucket(bucket_label, size)
      return BucketState.new(size, @bucket2, moves + 1) if bucket_label == 'one'

      BucketState.new(@bucket1, size, moves + 1)
    end

    def pour_from_one_bucket_to_another(bucket_label, size)
      sum_of_buckets = @bucket1 + @bucket2
      overflow_amount = sum_of_buckets - size
      after_pouring = pour(bucket_label, size, sum_of_buckets, overflow_amount)
      BucketState.new(after_pouring.first, after_pouring.last, moves + 1)
    end

    def pour(bucket_label, size, sum_of_buckets, overflow_amount)
      if bucket_label == 'one'
        [[overflow_amount, EMPTY].max, [sum_of_buckets, size].min]
      else
        [[sum_of_buckets, size].min, [overflow_amount, EMPTY].max]
      end
    end

    private_constant :EMPTY
  end

  def find_goal
    move_towards_goal until goal_reached
    determine_other_bucket
    determine_goal_bucket
  end

  def moves_count_to_goal
    @visited_states.last.moves
  end

  def determine_other_bucket
    @other_bucket = @visited_states.last.other(@goal)
  end

  def determine_goal_bucket
    @goal_bucket = @visited_states.last.goal_bucket(@goal)
  end

  attr_reader :goal_reached

  def take_a_step(state)
    return if visited?(state)

    @visited_states.add state
    @goal_reached = state.reached?(@goal)
    add_valid_moves_to_queue_for(state)
  end

  def initialize_buckets
    zero_state = BucketState.new(0, 0, 0)
    @visited_states.add zero_state
    if @start_with == 'one'
      @visited_states.add zero_state.fill_bucket_two(@size2)
      @potential_moves.add zero_state.fill_bucket_one(@size1)
    else
      @visited_states.add zero_state.fill_bucket_one(@size1)
      @potential_moves.add zero_state.fill_bucket_two(@size2)
    end
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

  # The queue of available moves built in BFS manner.
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

  # The list of states that have already been visited.
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
