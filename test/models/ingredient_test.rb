require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  test 'should have correct columns' do
    assert Ingredient.column_names.include?('quantity')
    assert Ingredient.column_names.include?('grocery')
    assert Ingredient.column_names.include?('measurement')
    assert Ingredient.column_names.include?('ingredientable_id')
    assert Ingredient.column_names.include?('ingredientable_type')
  end

  test 'should validate grocery' do
    ingredient = Ingredient.create(quantity: 1.00, measurement: 'Quarter Teaspoon')
    assert_not ingredient.save
    assert_not_nil ingredient.errors[:line1]
  end

  test 'should know entree' do
    assert_equal ingredients(:one).ingredientable, entrees(:one)
  end

  test 'should delegate entree name' do
    assert_equal ingredients(:one).ingredientable_name, entrees(:one).name
  end
end
