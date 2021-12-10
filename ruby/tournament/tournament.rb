class Tournament
  def self.tally(matches)
    teams = {}
    matches.each_line do |match|
      atoms = match.split(';')
      teams[atoms[0]] = 1
      teams[atoms[1]] = 0
      result = atoms[2].to_s.strip
    end

    <<~TALLY
      Team                           | MP |  W |  D |  L |  P
    TALLY
  end
end
