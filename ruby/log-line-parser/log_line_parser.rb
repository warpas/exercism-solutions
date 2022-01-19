# frozen_string_literal: true

# Implementation of the Log Line Parser exercise in Ruby track on Exercism.
class LogLineParser
  # @param line [Integer] log entry consisting of log level and message
  def initialize(line)
    @line = line
  end

  # @return [String] log message
  def message
    @line.split(':').last.strip
  end

  # @return [String] severity of the message
  def log_level
    @line.split(':').first[1..-2].downcase
  end

  # @return [String] reformatted log message with log level at the end
  def reformat
    "#{message.capitalize} (#{log_level})"
  end
end
