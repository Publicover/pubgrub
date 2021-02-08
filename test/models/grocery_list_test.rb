require "test_helper"

class GroceryListTest < ActiveSupport::TestCase
  setup do
    GroceryList.all.each { |list| list.update(meal_ids: Meal.current.pluck(:id))  }
  end

  test 'grocery lists have meal_ids' do
    assert_not_nil GroceryList.last.meal_ids
    assert_equal GroceryList.last.meal_ids.size, Meal.current.count
  end

  test 'list will populate meal_ids on create' do
    list = GroceryList.create!
    assert_equal list.meal_ids.size, Meal.current.count
    assert_equal list.meal_ids - Meal.current.pluck(:id), []
  end

  test 'will populate grocery quantities on create' do
    list = GroceryList.create!
    assert_not_nil list.grocery_quantity
  end

  test 'will populate when ingredients have measurements included' do
    # this is reasonbaly brittle, but send me an email if you can make it less so
    # fixtures show measurement as nil, which messes up my grocery_quantity json
    # so I'll just create a new :current meal
    meal = Meal.create!(name: 'Peppers and milk', user_id: users(:jim).id, status: :current, cuisine: 'Gross')
    Ingredient.create!(meal_id: meal.id, grocery: 'Milk', measurement: 'Teaspoon', quantity: 1.5)
    Ingredient.create!(meal_id: meal.id, grocery: 'Milk', measurement: 'Teaspoon', quantity: 4)
    Ingredient.create!(meal_id: meal.id, grocery: 'Milk', measurement: 'Cup', quantity: 5)
    Ingredient.create!(meal_id: meal.id, grocery: 'Green Peppers', quantity: 2)
    Ingredient.create!(meal_id: meal.id, grocery: 'Red Peppers', quantity: 3)
    Ingredient.create!(meal_id: meal.id, grocery: 'Peppers', quantity: 5)
    Ingredient.create!(meal_id: meal.id, grocery: 'Peppers', quantity: 5)
    list = GroceryList.create!
    assert list.grocery_quantity['Milk'].is_a?(Hash)
    assert_equal list.grocery_quantity['Milk'].size, 2
    assert_equal list.grocery_quantity['Milk']['Teaspoon'], "5.5"
    assert_equal list.grocery_quantity['Milk']['Cup'], "5.0"
    assert_equal list.grocery_quantity['Peppers'], "10.0"
  end

end
