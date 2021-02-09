require 'test_helper'

class SetCurrentGroceryListTest < ActionDispatch::IntegrationTest
  test 'should set new GroceryList as the only current' do
    assert_equal 0, GroceryList.current.count
    GroceryList.archived.each do |list|
      list.current!
    end
    assert_equal 0, GroceryList.archived.count
    assert_equal GroceryList.current.count, GroceryList.count

    SetCurrentGroceryList.new.set_current_list
    assert GroceryList.last.current?
    assert_equal 1, GroceryList.current.count
    assert_equal GroceryList.count, GroceryList.current.count + GroceryList.archived.count
  end
end
