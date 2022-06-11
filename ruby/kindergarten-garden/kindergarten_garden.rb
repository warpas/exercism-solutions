class Garden
  def initialize(garden_string, students = DEFAULT_ORDER)
    lines = []
    garden_string.lines.each do |line|
      lines += line.chars.map { |elem| DICTIONARY[elem] }.reject(&:nil?)
    end
    @translated = lines[0].zip(lines[1])
    create_methods(students)
    @student_order = save_order(students)
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
      the_garden_front << @translated[index].first
      the_garden_back << @translated[index].last
    end
    the_garden_front + the_garden_back
  end

  def save_order(students)
    index = 0
    student_ord = {}
    students.sort.each do |student|
      student_ord[student.downcase.to_sym] = [index * 2, index * 2 + 1]
      index += 1
    end
    student_ord
  end
end
