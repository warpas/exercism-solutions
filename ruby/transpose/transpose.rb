# frozen_string_literal: true

# Implementation of the Transpose exercise in Ruby track on Exercism.
class Transpose
  class << self
    # @param input_string [String]
    # @return [String]
    def transpose(input_string)
      flipped = flip_columns_with_rows(input_string)
      spaced_rows = fill_spaces(flipped)
      merge_rows(spaced_rows).strip
    end

    private

    def flip_columns_with_rows(input_string)
      input_string.lines.reduce([]) { |acc, line| acc << convert_to_columns(line.chomp) }
    end

    def convert_to_columns(line)
      line.chars.reduce([]) { |acc, char| acc << char }
    end

    def fill_spaces(rows)
      return rows if rows.empty?

      rows.each_with_index do |row, index|
        max_row = remaining_max(rows, index)
        next unless row.length < max_row

        difference = max_row - row.length
        difference.times do
          row.push(' ')
        end
      end

      rows
    end

    def remaining_max(rows, index)
      remaining_rows(rows, index).map(&:length).max
    end

    def remaining_rows(rows, limit)
      # TODO: use head, *tail = string ??
      rows[limit..rows.length]
    end

    def merge_rows(rows)
      return '' if rows.first.nil?

      output_string = ''
      rows.first.length.times do |index|
        non_null_rows = rows.reject { |row| row[index].nil? }
        build_line = non_null_rows.reduce('') { |acc, row| acc + row[index] }
        output_string += "#{build_line}\n"
      end
      output_string
    end
  end
end
