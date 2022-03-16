class Transpose
  class << self
    def transpose(input_string)
      rows = []
      input_string.each_line do |line|
        columns = []
        line.chomp.chars.each do |char|
          columns << char
        end
        rows << columns
      end
      spaced_rows = fill_spaces(rows)

      output_string = ''
      number_of_iterations = spaced_rows.first.nil? ? 0 : (spaced_rows.first.length)
      0.upto(number_of_iterations) do |index|
        build_line = ''
        spaced_rows.each do |row|
          build_line += row[index] unless row[index].nil?
        end
        output_string += "#{build_line}\n"
      end

      output_string.strip
    end

    def fill_spaces(rows)
      row_lengths = rows.map(&:length)
      max_row = row_lengths.max

      return rows if max_row.nil?

      rows.each_with_index do |row, index|
        max_row = following_max(rows, index)
        if row.length < max_row
          difference = max_row - row.length
          difference.times do
            row.push(' ')
          end
        end
      end

      rows
    end

    def following_max(rows, index)
      remaining = remaining_rows(rows, index)
      remaining.map(&:length).max
    end

    def remaining_rows(rows, limit)
      element_count = rows.length
      rows[limit..element_count]
    end
  end
end
