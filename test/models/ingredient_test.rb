require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  test 'should have correct columns' do
    assert Ingredient.column_names.include?('quantity')
    assert Ingredient.column_names.include?('grocery')
    assert Ingredient.column_names.include?('measurement')
    assert Ingredient.column_names.include?('meal_id')
    assert Ingredient.column_names.include?('ingredientable_id')
    assert Ingredient.column_names.include?('ingredientable_type')
  end

  test 'should validate grocery' do
    ingredient = Ingredient.create(quantity: 1.00, measurement: 'Quarter Teaspoon', meal_id: meals(:steak).id)
    assert_not ingredient.save
    assert_not_nil ingredient.errors[:line1]
  end

  test 'should validate meal' do
    ingredient = Ingredient.create(grocery: 'Steak', quantity: 1.00)
    assert_not ingredient.save
    assert_not_nil ingredient.errors[:line1]
  end

  test 'should know meal' do
    assert_equal ingredients(:one).meal, meals(:beet_pasta)
  end

  test 'should delgate meal name' do
    assert_equal ingredients(:one).meal_name, meals(:beet_pasta).name
  end
end
