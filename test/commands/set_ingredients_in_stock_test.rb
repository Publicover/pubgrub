require 'test_helper'

class SetCurrentGroceryListTest < ActionDispatch::IntegrationTest
  test 'should finish shopping' do
    assert_not_nil Ingredient.out_of_stock.count
    assert_not_nil Staple.out_of_stock.count
    SetIngredientsInStock.new.perform
    assert Ingredient.out_of_stock.count.zero?
    assert Staple.out_of_stock.count.zero?
    assert_equal Ingredient.count, Ingredient.in_stock.count
    assert_equal Staple.count, Staple.in_stock.count
  end
end
