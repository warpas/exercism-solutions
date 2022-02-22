# frozen_string_literal: true

# Implementation of the Two Bucket exercise in Ruby track on Exercism.
class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(size1, size2, goal, start_with)
    # p 'constructor'
    @size1 = size1
    @size2 = size2
    @goal = goal
    @start_with = start_with

    @goal_bucket = @start_with
    @other_bucket = 5

    @visited_states = []
    @goal_reached = false
    @moves_queue = MovesQueue.new

    perform_acrobatics
  end

  # def goal_bucket
  #   'one'
  #   # @start_with
  # end

  class MovesQueue
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

    def take
      # p @queue.length
      # p @queue.first
      # elem = @queue.shift
      # p @queue.length
      # p @queue.first
      # elem

      @queue.shift
    end

    def to_s
      @queue.map(&:to_s)
    end
  end

  class State
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

    def empty_bucket_one
      # puts 'empty_bucket_one'
      bucket1_after_pouring = 0
      bucket2_after_pouring = @bucket2
      State.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end

    def empty_bucket_two
      # puts 'empty_bucket_two'
      bucket1_after_pouring = @bucket1
      bucket2_after_pouring = 0
      State.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end

    def fill_bucket_one(size)
      # puts 'fill_bucket_one'
      bucket1_after_pouring = size
      bucket2_after_pouring = @bucket2
      State.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end

    def fill_bucket_two(size)
      # puts 'fill_bucket_two'
      bucket1_after_pouring = @bucket1
      bucket2_after_pouring = size
      State.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end

    def pour_from_bucket_one_to_bucket_two(size)
      # puts 'pour_from_bucket_one_to_bucket_two'
      sum_of_buckets = @bucket1 + @bucket2
      overflow_amount = sum_of_buckets - size
      bucket1_after_pouring = [overflow_amount, 0].max
      bucket2_after_pouring = [sum_of_buckets, size].min
      State.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end

    def pour_from_bucket_two_to_bucket_one(size)
      # puts 'pour_from_bucket_one_to_bucket_two'
      sum_of_buckets = @bucket1 + @bucket2
      overflow_amount = sum_of_buckets - size
      bucket1_after_pouring = [sum_of_buckets, size].min
      bucket2_after_pouring = [overflow_amount, 0].max
      State.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end
  end

  private

  def perform_acrobatics
    puts ""
    puts "s1 = #{@size1}, s2 = #{@size2}, goal = #{@goal}"

    @moves = 0
    empty_buckets
    make_initial_step
    move_towards_goal until goal_reached
  end

  # attr_reader :bucket1, :bucket2
  attr_reader :goal_reached

  def bucket1
    'one'
  end

  def bucket2
    'two'
  end

  def empty_buckets
    @visited_states << State.new(0, 0, @moves)
    @moves += 1
  end

  def make_initial_step
    current_state = fill_starting_bucket
    add_valid_moves_to_queue_for(current_state)
  end

  def take_a_step(state)
    @visited_states << state
    puts "goal reached?"
    p state.reached?(@goal)
    @goal_reached = state.reached?(@goal)
    add_valid_moves_to_queue_for(state)
  end

  def fill_starting_bucket
    # TODO: add logic for recognizing which is the starting bucket
    new_state = State.new(@size1, 0, @moves)
    @visited_states << new_state
    @moves += 1
    new_state
  end

  def add_valid_moves_to_queue_for(state)
    @moves_queue.add(state.empty_bucket_one)
    @moves_queue.add(state.empty_bucket_two)
    @moves_queue.add(state.fill_bucket_one(@size1))
    @moves_queue.add(state.fill_bucket_two(@size2))
    @moves_queue.add(state.pour_from_bucket_one_to_bucket_two(@size2))
    @moves_queue.add(state.pour_from_bucket_two_to_bucket_one(@size1))
    # p @moves_queue.to_s
    puts "moves_queue is #{@moves_queue.length} long"
  end

  def move_towards_goal
    perform_valid_moves

    @goal_reached = true if @moves > 5
  end

  def perform_valid_moves
    state = @moves_queue.take
    visited_state = did_we_visit_this_state_already?(state)
    @moves = state.moves
    return if visited_state

    p "unvisited state is #{state}"
    take_a_step(state)
  end

  def did_we_visit_this_state_already?(state)
    visited_already = false
    # p state
    # p state.to_s
    # p @visited_states
    @visited_states.each do |visited_state|
      # puts "visited: #{visited_state.to_s}"
      visited_already = true if visited_state.to_s == state.to_s
    end
    # p visited_already
    visited_already
  end

  def valid_moves
    # [
    #   'pouring from either bucket to another',
    #   'emptying either bucket and doing nothing to the other',
    #   'filling either bucket and doing nothing to the other'
    # ]

  end
end
