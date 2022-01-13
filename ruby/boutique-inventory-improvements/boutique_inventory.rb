# frozen_string_literal: true

require 'ostruct'

# Implementation of the Boutique Inventory Improvements exercise in Ruby track on Exercism.
class BoutiqueInventory
  attr_reader :items

  # @param items [Array<Hash{Symbol => Float, String, Hash{Symbol => Integer}}>]
  def initialize(items)
    @items = items.map { |item| OpenStruct.new(item) }
  end

  # @return [Array<String>] the list of names of all items
  def item_names
    items.map(&:name).sort
  end

  # @return [Integer] the sum of all items in stock
  def total_stock
    items.map(&:quantity_by_size).map(&:values).flatten.sum
  end
end
