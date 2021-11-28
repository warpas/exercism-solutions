class Acronym
  def self.abbreviate(string)
    string.split(/[-\s]+/).map(&:chr).join.upcase
  end
end
