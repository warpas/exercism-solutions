# frozen_string_literal: true

# Error type for unauthorized access to Movie Club member only activities
class NotMovieClubMemberError < RuntimeError; end

# Implementation of the Moviegoer exercise in Ruby track on Exercism.
class Moviegoer
  attr_reader :age, :member

  # @param age [Integer]
  # @param member [Boolean] is the person a Movie Club member?
  def initialize(age, member: false)
    @age = age
    @member = member
  end

  # @return [Integer] ticket price
  def ticket_price
    age >= DISCOUNT_MIN_AGE ? 10 : 15
  end

  # @return [Boolean] is the person old enough to watch a scary movie?
  def watch_scary_movie?
    age >= SCARY_MOVIE_MIN_AGE
  end

  # @raise [NotMovieClubMemberError] if the person is not a member of the Movie Club
  # @return [String] free popcorn for Movie Club members
  def claim_free_popcorn!
    raise NotMovieClubMemberError unless member

    '🍿'
  end

  DISCOUNT_MIN_AGE = 60
  private_constant :DISCOUNT_MIN_AGE

  SCARY_MOVIE_MIN_AGE = 18
  private_constant :SCARY_MOVIE_MIN_AGE
end
