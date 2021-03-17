# frozen_string_literal: true

class PopulateGroceryList
  def perform
    weekly_ingredients = {}
    Ingredient.current_with_entree.each do |ingredient|
      assign_all_ingredients(ingredient, weekly_ingredients)
    end
    Ingredient.current_with_side.each do |ingredient|
      assign_all_ingredients(ingredient, weekly_ingredients)
    end
    Staple.out_of_stock.each do |staple|
      assign_all_staples(staple, weekly_ingredients)
    end
    weekly_ingredients
  end

  def assign_all_ingredients(ingredient, hash)
    if hash.key?(ingredient.name)
      assign_when_key(ingredient, hash)
    else
      assign_when_not_key(ingredient, hash)
    end
  end

  def assign_when_key(ingredient, hash)
    if hash[ingredient.name].key?(ingredient.measurement)
      hash[ingredient.name][ingredient.measurement] += ingredient.quantity
    else
      hash[ingredient.name][ingredient.measurement] = ingredient.quantity
    end
    hash[ingredient.name][:ingredient_id] = ingredient.id
  end

  def assign_when_not_key(ingredient, hash)
    hash[ingredient.name] = if ingredient.measurement.nil?
                                 ingredient.quantity
                               else
                                 { ingredient.measurement => ingredient.quantity }
                               end
    hash[ingredient.name][:ingredient_id] = ingredient.id
  end

  def assign_all_staples(staple, hash)
    if hash.key?(staple.name)
      assign_staple_when_key(staple, hash)
    else
      assign_staple_when_not_key(staple, hash)
    end
  end

  def assign_staple_when_key(staple, hash)
    if hash[staple.name].key?(staple.measure)
      hash[staple.name][staple.measure] += staple.quantity
    else
      hash[staple.name][staple.measure] = staple.quantity
    end
    hash[staple.name][:staple_id] = staple.id
  end

  def assign_staple_when_not_key(staple, hash)
    hash[staple.name] = if staple.measure.nil?
                          staple.quantity
                        else
                          { staple.measure => staple.quantity }
                        end
    hash[staple.name][:staple_id] = staple.id
  end
end
