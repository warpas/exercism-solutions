class Tournament
  def self.tally(input)
    new(input).report
  end

  def initialize(matches)
    @scoreboard = ScoreBoard.new
    matches.each_line do |match|
      team1_name, team2_name, result = match.split(';')
      if !team1_name.to_s.strip.empty?
        team1 = @scoreboard.find_or_create(team1_name)
        team2 = @scoreboard.find_or_create(team2_name)
        result = result.to_s.strip
        case result
        when 'win'
          team1.win
          team2.loss
        when 'loss'
          team1.loss
          team2.win
        when 'draw'
          team1.draw
          team2.draw
        end
        @scoreboard.add(team1)
        @scoreboard.add(team2)
      end
    end

  end

  def report
    @scoreboard.display
  end
end

class ScoreBoard
  REPORT_FORMAT = "%-31s| %2s |  %s |  %s |  %s |  %s\n".freeze

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
      tally << REPORT_FORMAT % team.tally#.to_s
    end

    tally
  end

  def sorted_teams
    sorted_list = []
    @board.keys.each do |key|
      team = @board[key]
      sorted_list << team
    end

    sorted_list.sort_by { |team| [-team.points, team.name] }
  end
end

class TeamScore
  attr_reader :name

  def initialize(name)
    @name = name
    @matches_won = 0
    @matches_tied = 0
    @matches_lost = 0
  end

  def win
    @matches_won += 1
  end

  def loss
    @matches_lost += 1
  end

  def draw
    @matches_tied += 1
  end

  def points
    @matches_won * 3 + @matches_tied
  end

  def tally
    [name, matches_played, @matches_won, @matches_tied, @matches_lost, points]
  end

  private

  def matches_played
    @matches_won + @matches_lost + @matches_tied
  end

  def format_name
    spaces = 31 - name.length
    name + ' ' * spaces
  end
end
