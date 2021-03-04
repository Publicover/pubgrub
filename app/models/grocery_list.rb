# frozen_string_literal: true

class GroceryList < ApplicationRecord
  before_save :collect_current_entrees
  before_save :populate_current_ingredients
  after_create :set_current_grocery_list

  enum status: {
    archived: 0,
    current: 1
  }

  def collect_current_entrees
    assign_attributes(entree_ids: Entree.current.pluck(:id))
  end

  def populate_current_ingredients
    assign_attributes(grocery_quantity: PopulateGroceryList.new.perform)
  end

  def set_current_grocery_list
    SetCurrentGroceryList.new.set_current_list
  end
end
