class Matrix
  def initialize(string_representation)
    @string = string_representation
  end

  def rows
    @string.each_line.map do |line|
      line.split.map(&:to_i)
    end
  end

  def columns
    # columns = rows.transpose
    columns = []
    0.upto(rows.first.length - 1) do |i|
      column = []
      0.upto(rows.length - 1) do |j|
        column << rows[j][i]
      end
      columns << column
    end

    columns
  end
end
