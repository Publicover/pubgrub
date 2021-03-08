require "test_helper"

class GroceryListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    login_as users(:jim)
  end

  test 'should get finished shopping' do
    assert_not_nil Ingredient.out_of_stock.count
    assert_not_nil Staple.out_of_stock.count
    get grocery_lists_finished_shopping_path
    assert_response :found
    assert Ingredient.out_of_stock.count.zero?
    assert Staple.out_of_stock.count.zero?
    assert_redirected_to ingredients_path
  end
end
