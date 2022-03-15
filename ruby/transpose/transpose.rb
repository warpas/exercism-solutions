class Transpose
  class << self
    def transpose(input_string)
      # puts ''
      # p input_string
      rows = []
      input_string.each_line do |line|
        # p line
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
      # p row_lengths.min

      spaced_rows = fill_spaces(rows)

      output_string = ''
      number_of_iterations = spaced_rows.first.nil? ? 0 : (spaced_rows.first.length)
      # p spaced_rows
      0.upto(number_of_iterations) do |index|
        # p "index = #{index}"
        build_line = ''
        spaced_rows.each do |row|
          # p row[index]
          build_line += row[index] unless row[index].nil?
          # build_line += row[index].nil? ? " " : row[index]
        end
        # build_line.rstrip! if index.positive? && index >= row_lengths.min
        output_string += "#{build_line}\n"
      end

      # p input_string
      # p output_string.strip
      output_string.strip
    end

    def fill_spaces(rows)
      row_lengths = rows.map(&:length)
      max_row = row_lengths.max

      return rows if max_row.nil?

      # p rows
      rows.each_with_index do |row, index|
        # break if row.length == max_row

        max_row = following_max(rows, index)
        # p "row.length = #{row.length}, max_row = #{max_row}"
        if row.length < max_row
          difference = max_row - row.length
          # p 'less'
          # p row
          # p difference
          difference.times do
            # puts 'diff'
            row.push(' ')
          end
        end
      end

      rows
    end

    def following_max(rows, index)
      # p "index = #{index}, rows.length = #{rows.length}"
      remaining = remaining_rows(rows, index)
      # p "remaining = #{remaining}"

      remaining.map(&:length).max
    end

    def remaining_rows(rows, limit)
      # 0.upto(limit) do |index|
      #   p index
      #   rows.first
      # end

      element_count = rows.length

      rows[limit..element_count]
    end
  end
end
