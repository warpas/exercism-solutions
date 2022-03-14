class Transpose
  class << self
    def transpose(input_string)
      puts ''
      # p input_string
      rows = []
      input_string.each_line do |line|
        p line
        columns = []
        line.chomp.chars.each do |char|
          columns << char
        end
        rows << columns
      end

      # output_string = ''
      # p rows
      # p "rows.length = #{rows.length}"
      # rows.each do |row|
      #   p row
      #   p "column.length = #{row.length}"
      #   row.each do |column|
      #     output_string += column
      #     output_string += "\n" if row.length > 1
      #   end
      # end

      output_string2 = ''
      number_of_iterations = rows.first.nil? ? 0 : (rows.first.length)
      p rows
      row_lengths = rows.map(&:length)
      # p row_lengths.min

      0.upto(number_of_iterations) do |index|
        # p "index = #{index}"
        build_line = ''
        rows.each do |row|
          # p row[index]
          build_line += row[index] unless row[index].nil?
          # build_line += row[index].nil? ? " " : row[index]
        end
        # build_line.rstrip! if index.positive? && index >= row_lengths.min
        output_string2 += "#{build_line}\n"
      end

      p input_string
      p output_string2.strip
      output_string2.strip
    end
  end
end
