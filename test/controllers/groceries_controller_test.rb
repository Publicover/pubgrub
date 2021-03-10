require "test_helper"

class GroceriesControllerTest < ActionDispatch::IntegrationTest
  class AsAdmin < GroceriesControllerTest
    setup do
      login_as users(:jim)
    end

    test 'should get index' do
      get groceries_path
      assert_response :success
    end

    test 'should get single record' do
      get groceries_path(groceries(:one))
      assert_response :success
    end

    test 'should get new' do
      get new_grocery_path
      assert_response :success
    end

    test 'should create' do
      assert_difference('Grocery.count') do
        post groceries_path, params: {
          grocery: {
            name: 'Candy',
            calories_per_gram: 5.1,
            calories_per_package: 510,
            grams_per_package: 100
          }
        }
      end
      assert_redirected_to groceries_path
    end

    test 'should get edit' do
      get edit_grocery_path(groceries(:one))
      assert_response :success
    end

    test 'should update' do
      name = Faker::Lorem.word
      patch grocery_path(groceries(:one)), params: {
        grocery: {
          name: name
        }
      }
      assert_redirected_to grocery_path(groceries(:one))
    end

    test 'should destroy' do
      assert_difference('Grocery.count', -1) do
        delete grocery_path(groceries(:one))
      end
      assert_redirected_to groceries_path
    end
  end

  class AsMember < GroceriesControllerTest
    setup do
      login_as users(:dave)
    end

    test 'should not get index' do
      assert_raises(Pundit::NotAuthorizedError) {
        get groceries_path
      }
    end

    test 'should not get single record' do
      assert_raises(Pundit::NotAuthorizedError) {
        get groceries_path(groceries(:one))
      }
    end

    test 'should not get new' do
      assert_raises(Pundit::NotAuthorizedError) {
        get new_grocery_path
      }
    end

    test 'should not create' do
      assert_raises(Pundit::NotAuthorizedError) {
        post groceries_path, params: {
          grocery: {
            name: 'Candy'
          }
        }
      }
    end

    test 'should not get edit' do
      assert_raises(Pundit::NotAuthorizedError) {
        get edit_grocery_path(groceries(:one))
      }
    end

    test 'should not update' do
      name = Faker::Lorem.word
      assert_raises(Pundit::NotAuthorizedError) {
        patch grocery_path(groceries(:one)), params: {
          grocery: {
            name: name
          }
        }
      }
    end

    test 'should not destroy' do
      assert_raises(Pundit::NotAuthorizedError) {
        delete grocery_path(groceries(:one))
      }
    end
  end
end
