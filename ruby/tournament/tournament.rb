class Tournament
  def self.tally(input)
    new(input).report
  end

  def initialize(match_results)
    @scoreboard = ScoreBoard.new
    match_results.each_line do |line|
      parse(line.strip)
    end
  end

  def report
    @scoreboard.display
  end

  private

  def parse(line)
    team1_name, team2_name, result = line.split(';')
    return if result.nil?

    team1 = @scoreboard.find_or_create(team1_name)
    team2 = @scoreboard.find_or_create(team2_name)
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

    @board.values
          .sort_by { |team| [-team.points, team.name] }
          .each { |team| tally << REPORT_FORMAT % team.tally }

    tally
  end
end

class TeamScore
  attr_reader :name

  def initialize(name)
    @name = name
    @won = @tied = @lost = 0
  end

  def win
    @won += 1
  end

  def loss
    @lost += 1
  end

  def draw
    @tied += 1
  end

  def points
    @won * 3 + @tied
  end

  def tally
    [name, played, @won, @tied, @lost, points]
  end

  private

  def played
    @won + @lost + @tied
  end
end
