# frozen_string_literal: true

# Implementation of the Boutique Inventory exercise in Ruby track on Exercism.
class BoutiqueInventory
  # @param items [Array<Hash{Symbol => Float, String, Hash{Symbol => Integer}}>]
  def initialize(items)
    @items = items
  end

  # @return [Array<String>] the list of names of all items
  def item_names
    items.map { |item| item[:name] }.sort
  end

  # @return [Array<Hash{Symbol => Float, String, Hash{Symbol => Integer}}>] the list of cheap items
  def cheap
    items.select { |item| item[:price] < CHEAP_ITEM_THRESHOLD }
  end

  # @return [Array<Hash{Symbol => Float, String, Hash{Symbol => Integer}}>] the list of items out of stock
  def out_of_stock
    items.select { |item| item[:quantity_by_size].empty? }
  end

  # @param name [String] name of the item for stock lookup
  # @return [Hash{Symbol => Integer}] the state of stock for the item in Hash form
  def stock_for_item(name)
    items.find { |item| item[:name] == name }[:quantity_by_size]
  end

  # @return [Integer] the sum of all items in stock
  def total_stock
    items.map { |item| item[:quantity_by_size].values.sum }.sum
  end

  private

  CHEAP_ITEM_THRESHOLD = 30
  private_constant :CHEAP_ITEM_THRESHOLD

  attr_reader :items
end
