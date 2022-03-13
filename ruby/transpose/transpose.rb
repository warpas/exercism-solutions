# frozen_string_literal: true

class Transpose
  class << self
    def transpose(input_string)
      rows = []
      input_string.lines do |line|
        p line
        columns = []
        line.strip.chars.each do |char|
          columns << char
        end
        rows << columns
      end

      output_string = ''
      p rows
      p "rows.length = #{rows.length}"
      rows.each do |row|
        p row
        p "column.length = #{row.length}"
        row.each do |column|
          output_string += column + "\n"
        end
      end

      output_string.strip
    end
  end
end
