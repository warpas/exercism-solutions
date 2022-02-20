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

  def perform_acrobatics
    puts ""
    puts "s1 = #{@size1}, s2 = #{@size2}, goal = #{@goal}"

    @moves = 0
    empty_buckets
    make_initial_step
    move_towards_goal until @moves_queue.empty? # @goal_reached
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
      @queue.pop
    end
  end

  class State
    def initialize(bucket1, bucket2, moves)
      @bucket1 = bucket1
      @bucket2 = bucket2
      @moves = moves
    end

    def to_s
      "#{bucket1},#{bucket2}"
    end

    def empty_bucket_one
      puts 'empty_bucket_one'
      p @bucket1
      p @bucket2
      State.new(0, @bucket2, @moves + 1)
    end

    def empty_bucket_two
      puts 'empty_bucket_two'
      p @bucket1
      p @bucket2
      State.new(@bucket1, 0, @moves + 1)
    end

    def fill_bucket_one(size)
      puts 'fill_bucket_one'
      p size
      State.new(size, @bucket2, @moves + 1)
    end

    def fill_bucket_two(size)
      puts 'fill_bucket_two'
      p size
      State.new(@bucket1, size, @moves + 1)
    end

    def pour_from_bucket_one_to_bucket_two(size)
      puts 'pour_from_bucket_one_to_bucket_two'
      bucket1_after_pouring = 0
      bucket2_after_pouring = @bucket1
      State.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end

    def pour_from_bucket_two_to_bucket_one(size)
      puts 'pour_from_bucket_one_to_bucket_two'
      p @bucket1
      p @bucket2
      p size
      bucket1_after_pouring = @bucket2
      bucket2_after_pouring = 0
      State.new(bucket1_after_pouring, bucket2_after_pouring, @moves + 1)
    end
  end

  private

  # attr_reader :bucket1, :bucket2
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
    p @moves_queue
    p @moves_queue.length
  end

  def move_towards_goal
    perform_valid_moves

    @goal_reached = true if @moves > 90
  end

  def perform_valid_moves
    state = @moves_queue.take
    p state
    # @
  end

  def valid_moves
    # [
    #   'pouring from either bucket to another',
    #   'emptying either bucket and doing nothing to the other',
    #   'filling either bucket and doing nothing to the other'
    # ]

  end
end
