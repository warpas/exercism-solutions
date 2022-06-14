class Garden
  def initialize(garden_string, students = DEFAULT_ORDER)
    @as_hash = parse_garden(garden_string)
    @student_order = save_order(students)
    create_methods(students)
  end

  private

  def create_methods(names)
    names.each do |name|
      define_singleton_method(name.downcase) do
        build_garden(name.downcase.to_sym)
      end
    end
  end

  DICTIONARY = {
    'R' => :radishes,
    'C' => :clover,
    'G' => :grass,
    'V' => :violets
  }.freeze

  DEFAULT_ORDER = %w[
    Alice
    Bob
    Charlie
    David
    Eve
    Fred
    Ginny
    Harriet
    Ileana
    Joseph
    Kincaid
    Larry
  ].freeze

  private_constant :DICTIONARY

  def build_garden(owner)
    the_garden_front = []
    the_garden_back = []
    @student_order[owner].each do |index|
      the_garden_front << @as_hash[index].first
      the_garden_back << @as_hash[index].last
    end
    the_garden_front + the_garden_back
  end

  def save_order(students)
    student_ord = {}
    students.sort.each_with_index do |student, index|
      student_ord[student.downcase.to_sym] = [index * 2, index * 2 + 1]
    end
    student_ord
  end

  def parse_garden(garden_string)
    lines = []
    garden_string.lines.each do |line|
      lines << line.chars.map { |elem| DICTIONARY[elem] }.reject(&:nil?)
    end

    lines[0].zip(lines[1])
  end
end
