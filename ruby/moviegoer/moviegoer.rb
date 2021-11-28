class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  DISCOUNT_MIN_AGE = 60
  SCARY_MOVIE_MIN_AGE = 18

  attr_reader :age, :member

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    return 10 if age >= DISCOUNT_MIN_AGE

    15
  end

  def watch_scary_movie?
    age >= SCARY_MOVIE_MIN_AGE
  end

  def claim_free_popcorn!
    raise NotMovieClubMemberError unless member

    '🍿'
  end
end
