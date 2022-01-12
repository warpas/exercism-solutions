# frozen_string_literal: true

# Implementation of the High Scores exercise in Ruby track on Exercism.
class HighScores
  attr_reader :scores

  # @param scores [Array<Integer>] collection of scores from the game
  def initialize(scores)
    @scores = scores
    @sorted_scores = scores.sort
  end

  # @return [Integer] the score from the last game
  def latest
    scores.last
  end

  # @return [Integer] the best score recorded in the game
  def personal_best
    sorted_scores.last
  end

  # @return [Array<Integer>] collection of the three best scores from the game
  def personal_top_three
    sorted_scores.last(3).reverse
  end

  # @return [Boolean] is the last score from the last game also the personal best?
  def latest_is_personal_best?
    latest == personal_best
  end

  private

  attr_reader :sorted_scores
end
