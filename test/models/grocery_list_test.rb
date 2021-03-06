require "test_helper"

class GroceryListTest < ActiveSupport::TestCase
  setup do
    GroceryList.all.each { |list| list.update(entree_ids: Entree.current.pluck(:id))  }
  end

  test 'should have correct columns' do
    assert GroceryList.column_names.include?('grocery_quantity')
    assert GroceryList.column_names.include?('entree_ids')
    assert GroceryList.column_names.include?('status')
  end

  test 'grocery lists have entree_ids' do
    assert_not_nil GroceryList.last.entree_ids
    assert_equal GroceryList.last.entree_ids.size, Entree.current.count
  end

  test 'list will populate entree_ids on create' do
    list = GroceryList.create!
    assert_equal list.entree_ids.size, Entree.current.count
    assert_equal list.entree_ids - Entree.current.pluck(:id), []
  end

  test 'will populate grocery quantities on create' do
    list = GroceryList.create!
    assert_not_nil list.grocery_quantity
  end

  test 'will populate when ingredients have measurements included' do
    entree = Entree.create!(name: 'Peppers and milk',
                            user_id: users(:jim).id,
                            cuisine_id: cuisines(:american).id,
                            number_of_sides: 1,
                            status: :current)
    side = Side.create!(name: 'Whole Buncha Chips',
                        user_id: users(:jim).id,
                        side_category: side_categories(:starch),
                        status: :current)

    Ingredient.create!(ingredientable_id: entree.id, ingredientable_type: 'Entree', grocery_id: groceries(:milk).id, measurement: 'Teaspoon', quantity: 1.5)
    Ingredient.create!(ingredientable_id: entree.id, ingredientable_type: 'Entree', grocery_id: groceries(:milk).id, measurement: 'Teaspoon', quantity: 4)
    Ingredient.create!(ingredientable_id: entree.id, ingredientable_type: 'Entree', grocery_id: groceries(:milk).id, measurement: 'Cup', quantity: 5)
    Ingredient.create!(ingredientable_id: entree.id, ingredientable_type: 'Entree', grocery_id: groceries(:green_peppers).id, quantity: 2)
    Ingredient.create!(ingredientable_id: entree.id, ingredientable_type: 'Entree', grocery_id: groceries(:red_peppers).id, measurement: 'Entire', quantity: 3)
    Ingredient.create!(ingredientable_id: entree.id, ingredientable_type: 'Entree', grocery_id: groceries(:peppers).id, quantity: 5)
    Ingredient.create!(ingredientable_id: entree.id, ingredientable_type: 'Entree', grocery_id: groceries(:peppers).id, quantity: 5)
    Ingredient.create!(ingredientable_id: side.id, ingredientable_type: 'Side', grocery_id: groceries(:bag_of_chips).id, measurement: 'small', quantity: 1)
    Ingredient.create!(ingredientable_id: side.id, ingredientable_type: 'Side', grocery_id: groceries(:bag_of_chips).id, measurement: 'small', quantity: 1)
    Ingredient.create!(ingredientable_id: side.id, ingredientable_type: 'Side', grocery_id: groceries(:then_a_big_bag_of_chips).id, quantity: 1)
    Ingredient.create!(ingredientable_id: side.id, ingredientable_type: 'Side', grocery_id: groceries(:dip).id, measurement: 'HUGE', quantity: 1)
    Ingredient.create!(ingredientable_id: side.id, ingredientable_type: 'Side', grocery_id: groceries(:green_peppers).id, measurement: 'Bag', quantity: 1)
    Staple.create!(grocery_id: groceries(:pretzel_sticks).id, measurement_id: measurements(:bag).id, quantity: 1, user_id: users(:jim).id, status: :out_of_stock, grams_per_package: 100, calories_per_package: 210)
    Staple.create!(grocery_id: groceries(:lunch_meat).id, measurement_id: measurements(:bag).id, quantity: 1, user_id: users(:jim).id, status: :out_of_stock, grams_per_package: 100, calories_per_package: 114)

    list = GroceryList.create!
    # this will be 3 because it's two measurements and the id
    assert list.grocery_quantity['Milk'].is_a?(Hash)
    assert_equal list.grocery_quantity['Milk'].size, 3
    assert_equal list.grocery_quantity['Milk']['Teaspoon'], "5.5"
    assert_equal list.grocery_quantity['Milk']['Cup'], "5.0"
    assert_equal list.grocery_quantity['Peppers']['Whole'], "10.0"
    assert_equal list.grocery_quantity['Red Peppers']['Entire'], "3.0"
    assert_equal list.grocery_quantity['Bag of Chips']['small'], "2.0"
    assert_equal list.grocery_quantity['Then a Big Bag of Chips']['Whole'], "1.0"
    assert_equal list.grocery_quantity['Dip']['HUGE'], "1.0"
    assert_equal list.grocery_quantity['Pretzel Sticks']['Bag'], 1
    assert_equal list.grocery_quantity['Lunch Meat']['Bag'], 1
  end

  test 'will make new list the only current list on create' do
    assert_equal GroceryList.count, GroceryList.archived.count
    assert_equal 0, GroceryList.current.count
    GroceryList.create!
    assert_equal 1, GroceryList.current.count
    assert_equal GroceryList.count, GroceryList.current.count + GroceryList.archived.count
  end
end
