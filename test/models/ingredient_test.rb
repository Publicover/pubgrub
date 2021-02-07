require "test_helper"

class IngredientTest < ActiveSupport::TestCase
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
end
