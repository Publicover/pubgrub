class GroceryList < ApplicationRecord
  before_save :collect_current_meals
  before_save :collect_current_ingredients

  enum status: {
    archived: 0,
    current: 1
  }

  def collect_current_meals
    assign_attributes(meal_ids: Meal.current.pluck(:id))
  end

  def collect_current_ingredients
    weekly_ingredients = Hash.new
    meal_ids.each do |meal_id|
      Meal.find(meal_id).ingredients.each do |ingredient|
        if weekly_ingredients.key?(ingredient.grocery)
          assign_when_not_key(ingredient, weekly_ingredients)
        else
          assign_when_key(ingredient, weekly_ingredients)
        end
      end
    end
    assign_attributes(grocery_quantity: weekly_ingredients)
  end

  def assign_when_not_key(ingredient, hash)
    if ingredient.measurement.nil?
      hash[ingredient.grocery] += ingredient.quantity
    else
      if hash[ingredient.grocery].key?(ingredient.measurement)
        hash[ingredient.grocery][ingredient.measurement] += ingredient.quantity
      else
        hash[ingredient.grocery][ingredient.measurement] = ingredient.quantity
      end
    end
  end

  def assign_when_key(ingredient, hash)
    if ingredient.measurement.nil?
      hash[ingredient.grocery] = ingredient.quantity
    else
      hash[ingredient.grocery] = { ingredient.measurement => ingredient.quantity }
    end
  end
end
