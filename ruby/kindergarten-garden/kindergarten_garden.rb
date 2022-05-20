class Garden
  def initialize(arg)
    @garden_string = arg
  end

  def alice
    # [:radishes, :clover, :grass, :grass]
    p(@garden_string.chars.map { |elem| DICTIONARY[elem] }.reject(&:nil?))
  end

  private

  DICTIONARY = {
    'R' => :radishes,
    'C' => :clover,
    'G' => :grass,
    'V' => :violets,
  }

  private_constant :DICTIONARY
end
