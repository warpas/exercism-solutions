class Tournament
  def self.tally(matches)
    teams = {}
    matches.each_line do |match|
      atoms = match.split(';')
      condition = !atoms[0].to_s.strip.empty?
      if condition
        team1 = TeamScore.new(atoms[0])
        team2 = TeamScore.new(atoms[1])
        result = atoms[2].to_s.strip
        if result == 'win'
          team1.win
          team2.loss
        elsif result == 'loss'
          team1.loss
          team2.win
        end
        teams[team1.name] = team1
        teams[team2.name] = team2
      end
    end

    format_output(teams)
  end

  def self.format_output(hash)
    tally = <<~TALLY
      Team                           | MP |  W |  D |  L |  P
    TALLY

    return tally unless hash.keys.length.positive?

    sorted_list = []
    hash.keys.each do |key|
      team = hash[key]
      if sorted_list.empty?
        sorted_list << team
      elsif team.points.positive?
        sorted_list.unshift(team)
      else
        sorted_list << team
      end
    end

    sorted_list.each do |team|
      tally << team.to_s
    end

    tally
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

  def to_s
    "#{name}             |  #{matches_played} |  #{matches_won} |  #{matches_tied} |  #{matches_lost} |  #{points}\n"
  end
end
