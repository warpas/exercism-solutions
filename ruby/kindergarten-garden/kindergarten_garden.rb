class Garden
  def initialize(arg, students = DEFAULT_ORDER)
    garden_string = arg
    line1, line2 = garden_string.lines
    @students = students
    @student_order = save_order(students)
    translated_line1 = line1.chars.map { |elem| DICTIONARY[elem] }.reject(&:nil?)
    translated_line2 = line2.chars.map { |elem| DICTIONARY[elem] }.reject(&:nil?)
    @translated = translated_line1.zip(translated_line2)
  end

  @students.each do |name|
    define_method(name.downcase) do
      build_garden(name.downcase.to_sym)
    end
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

  def david
    build_garden(:david)
  end

  def eve
    build_garden(:eve)
  end

  def fred
    build_garden(:fred)
  end

  def ginny
    build_garden(:ginny)
  end

  def harriet
    build_garden(:harriet)
  end

  def ileana
    build_garden(:ileana)
  end

  def joseph
    build_garden(:joseph)
  end

  def kincaid
    build_garden(:kincaid)
  end

  def larry
    build_garden(:larry)
  end

  def patricia
    build_garden(:patricia)
  end

  def roger
    build_garden(:roger)
  end

  def samantha
    build_garden(:samantha)
  end

  def xander
    build_garden(:xander)
  end

  private

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
