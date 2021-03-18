require 'test_helper'

class CalculateCaloriesTest < ActiveSupport::TestCase
  test 'should calculate calories_per_gram' do
    gross = Entree.create!(name: 'Gross', number_of_sides: 0, cuisine_id: cuisines(:american).id, user_id: users(:jim).id)
    ing1 = Ingredient.create!(grocery_id: groceries(:one).id, total_grams: 100, ingredientable_id: gross.id, ingredientable_type: 'Entree')
    ing2 = Ingredient.create!(grocery_id: groceries(:russian_bread).id, total_grams: 200, ingredientable_id: gross.id, ingredientable_type: 'Entree')
    ing3 = Ingredient.create!(grocery_id: groceries(:lunch_meat).id, total_grams: 150, ingredientable_id: gross.id, ingredientable_type: 'Entree')
    ing4 = Ingredient.create!(grocery_id: groceries(:pretzel_sticks).id, total_grams: 75, ingredientable_id: gross.id, ingredientable_type: 'Entree')

    cals = (ing1.calories_per_gram * ing1.total_grams) +
           (ing2.calories_per_gram * ing2.total_grams) +
           (ing3.calories_per_gram * ing3.total_grams) +
           (ing4.calories_per_gram * ing4.total_grams)
    grams = gross.ingredients.sum(:total_grams)
    total_calories_per_gram = (cals / grams).round(2)
    assert_equal CalculateCalories.new.calculate_calories_per_gram(gross), total_calories_per_gram
  end
end
