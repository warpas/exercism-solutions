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
    fill_starting_bucket
    add_valid_moves_to_queue
    move_towards_goal until @goal_reached
  end

  # def goal_bucket
  #   'one'
  #   # @start_with
  # end

  class MovesQueue
    def initialize
      @queue = []
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
  end

  private

  def empty_buckets
    @visited_states << State.new(0, 0, @moves)
    @moves += 1
  end

  def fill_starting_bucket
    # TODO: add logic for recognizing which is the starting bucket
    @visited_states << State.new(@size1, 0, @moves)

    @moves += 1
  end

  def move_towards_goal
    perform_valid_moves

    @goal_reached = true if @moves > 90
  end

  def perform_valid_moves
    fill_starting_bucket
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
