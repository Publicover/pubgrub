# frozen_string_literal: true

class GroceryList < ApplicationRecord
  before_save :collect_current_entrees
  before_save :collect_current_ingredients
  after_create :set_current_grocery_list

  enum status: {
    archived: 0,
    current: 1
  }

  def collect_current_entrees
    assign_attributes(entree_ids: Entree.current.pluck(:id))
  end

  def collect_current_ingredients
    weekly_ingredients = {}
    Ingredient.current_with_entree.each do |ingredient|
      assign_all_ingredients(ingredient, weekly_ingredients)
    end
    Ingredient.current_with_side.each do |ingredient|
      assign_all_ingredients(ingredient, weekly_ingredients)
    end
    assign_attributes(grocery_quantity: weekly_ingredients)
  end

  def assign_when_key(ingredient, hash)
    if ingredient.measurement.nil?
      hash[ingredient.grocery] += ingredient.quantity
    elsif hash[ingredient.grocery].key?(ingredient.measurement)
      hash[ingredient.grocery][ingredient.measurement] += ingredient.quantity
    else
      hash[ingredient.grocery][ingredient.measurement] = ingredient.quantity
    end
  end

  def assign_when_not_key(ingredient, hash)
    hash[ingredient.grocery] = if ingredient.measurement.nil?
                                 ingredient.quantity
                               else
                                 { ingredient.measurement => ingredient.quantity }
                               end
  end

  def set_current_grocery_list
    SetCurrentGroceryList.new.set_current_list
  end

  def assign_all_ingredients(ingredient, hash)
    if hash.key?(ingredient.grocery)
      assign_when_key(ingredient, hash)
    else
      assign_when_not_key(ingredient, hash)
    end
  end
end
