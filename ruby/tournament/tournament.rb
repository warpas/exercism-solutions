# frozen_string_literal: true

# Implementation of the Tournament exercise in Ruby track on Exercism.
class Tournament
  def self.tally(input)
    new(input).report
  end

  def initialize(match_results)
    @scoreboard = ScoreBoard.new
    @results_string = match_results
  end

  def report
    @results_string.each_line do |line|
      parse(line.strip)
    end
    @scoreboard.display
  end

  private

  def parse(line)
    team1_name, team2_name, result = line.split(';')
    return if result.nil?

    team1 = @scoreboard.find_or_create(team1_name)
    team2 = @scoreboard.find_or_create(team2_name)
    apply_score(result, team1, team2)
    @scoreboard.add(team1)
    @scoreboard.add(team2)
  end

  def apply_score(result, team1, team2)
    case result
    when 'win'
      team1.win_over(team2)
    when 'loss'
      team2.win_over(team1)
    when 'draw'
      team1.draw
      team2.draw
    end
  end

  # The representation of the Score Board not available to outside classes
  class ScoreBoard
    REPORT_HEADER = %w[Team MP W D L P].freeze
    REPORT_FORMAT = "%-31s| %2s |  %s |  %s |  %s |  %s\n"

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
      tally = REPORT_FORMAT % REPORT_HEADER
      @board.values
            .sort_by { |team| [-team.points, team.name] }
            .each { |team| tally << REPORT_FORMAT % team.tally }

      tally
    end
  end

  # The representation of the Team not available to outside classes
  class TeamScore
    attr_reader :name

    def initialize(name)
      @name = name
      @won = @tied = @lost = 0
    end

    def win_over(other_team)
      win
      other_team.loss
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

  private_constant :ScoreBoard
  private_constant :TeamScore
end
