class Tournament
  def self.tally(matches)
    scoreboard = ScoreBoard.new
    matches.each_line do |match|
      atoms = match.split(';')
      if !atoms[0].to_s.strip.empty?
        team1 = scoreboard.find_or_create(atoms[0])
        team2 = scoreboard.find_or_create(atoms[1])
        result = atoms[2].to_s.strip
        if result == 'win'
          team1.win
          team2.loss
        elsif result == 'loss'
          team1.loss
          team2.win
        elsif result == 'draw'
          team1.draw
          team2.draw
        end
        scoreboard.add(team1)
        scoreboard.add(team2)
      end
    end

    scoreboard.display
  end
end

class ScoreBoard
  def initialize
    @board = {}
  end

  def find_or_create(team_name)
    existing_team = @board[team_name]
    if existing_team.nil?
      TeamScore.new(team_name)
    else
      existing_team
    end
  end

  def add(team)
    @board[team.name] = team
  end

  def display
    tally = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
    TALLY

    sorted_teams.each do |team|
      tally << team.to_s
    end

    tally
  end

  def sorted_teams
    sorted_list = []
    @board.keys.each do |key|
      team = @board[key]
      if sorted_list.empty?
        sorted_list << team
      elsif team.points > sorted_list.last.points
        sorted_list.unshift(team)
      else
        sorted_list << team
      end
    end

    sorted_list.sort_by(&:points).reverse.sort_by_name
  end
end

class Array
  def sort_by_name
    # TODO: only sorts two elements with equal scores, needs more
    sorted = []
    self.each_with_index do |elem, index|
      if sorted.empty?
        sorted << elem
      elsif sorted.last.points != elem.points
        sorted << elem
      else
        if sorted.last.name > elem.name
          sorted[index] = sorted.last
          sorted[index - 1] = elem
        else
          sorted << elem
        end
      end
    end

    sorted
  end
end

class TeamScore
  attr_reader :name, :matches_played, :matches_won, :matches_tied, :matches_lost, :points
  def initialize(name)
    @name = name
    @matches_played = 0
    @matches_won = 0
    @matches_tied = 0
    @matches_lost = 0
    @points = 0
  end

  def win
    @matches_played += 1
    @matches_won += 1
    @points += 3
  end

  def loss
    @matches_played += 1
    @matches_lost += 1
  end

  def draw
    @matches_played += 1
    @matches_tied += 1
    @points += 1
  end

  def to_s
    "#{format_name}|  #{matches_played} |  #{matches_won} |  #{matches_tied} |  #{matches_lost} |  #{points}\n"
  end

  private

  def format_name
    spaces = 31 - name.length
    name + ' ' * spaces
  end
end
