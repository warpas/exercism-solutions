# frozen_string_literal: true

# Implementation of the Robot Name exercise in Ruby track on Exercism.
class Robot
  def self.forget
  end

  def initialize
    @old_names = []
  end

  def name
    p @old_names
    candidate = new_name
    @old_names << candidate
    @name ||= candidate
  end

  def reset
    @name = new_name
  end

  private

  def new_name
    if @old_names.empty?
      "AX#{Kernel.rand(100..999)}"
    else
      "EC#{Kernel.rand(100..999)}"
    end
  end
end
