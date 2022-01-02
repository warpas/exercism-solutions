# frozen_string_literal: true

# Implementation of the Amusement Park exercise in Ruby track on Exercism.
class Attendee
  attr_reader :height, :pass_id

  # @param height [Integer] in centimeters
  # @return [Attendee] attendee without a pass
  def initialize(height)
    @height = height
    revoke_pass!
  end

  # @param pass_id [Integer] pass ID number
  # @return [Integer] new pass ID
  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  # @return [nil] nil represents missing pass
  def revoke_pass!
    @pass_id = nil
  end
end
