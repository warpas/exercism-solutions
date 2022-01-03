# frozen_string_literal: true

# Implementation of the Amusement Park Improvements exercise in Ruby track on Exercism.
class Attendee
  # @param height [Integer] in centimeters
  # @return [Attendee] attendee without a pass
  def initialize(height)
    @height = height
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

  # Do not edit above methods, add your own methods below.

  # rubocop:disable Naming/PredicateName
  # @return [Boolean] does the Attendee have a valid pass?
  def has_pass?
    !@pass_id.nil?
  end
  # rubocop:enable Naming/PredicateName

  # @param ride_minimum_height [Integer] in centimeters
  # @return [Boolean] is the Attendee tall enough to ride?
  def fits_ride?(ride_minimum_height)
    @height >= ride_minimum_height
  end

  # @param ride_minimum_height [Integer] in centimeters
  # @return [Boolean] is the Attendee allowed to ride?
  def allowed_to_ride?(ride_minimum_height)
    has_pass? && fits_ride?(ride_minimum_height)
  end
end
