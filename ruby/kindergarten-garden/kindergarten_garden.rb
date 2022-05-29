class Garden
  def initialize(arg)
    # p arg
    garden_string = arg
    line1, line2 = garden_string.lines
    # p "line1 = #{line1}, line2 = #{line2}"
    translated_line1 = line1.chars.map { |elem| DICTIONARY[elem] }.reject(&:nil?)
    translated_line2 = line2.chars.map { |elem| DICTIONARY[elem] }.reject(&:nil?)
    # p "t_line1 = #{translated_line1}, t_line2 = #{translated_line2}"
    @translated = translated_line1.zip(translated_line2)
    # p "end of input"
  end

  def alice
    build_garden(:alice)
  end

  def bob
    build_garden(:bob)
  end

  def charlie
    build_garden(:charlie)
  end

  private

  DICTIONARY = {
    'R' => :radishes,
    'C' => :clover,
    'G' => :grass,
    'V' => :violets
  }.freeze

  ORDER = {
    alice: [0, 1],
    bob: [2, 3],
    charlie: [4, 5]
  }.freeze

  private_constant :DICTIONARY

  def build_garden(owner)
    the_garden_front = []
    the_garden_back = []
    ORDER[owner].each do |index|
      the_garden_front << @translated[index].first
      the_garden_back << @translated[index].last
    end
    the_garden_front + the_garden_back
  end
end
