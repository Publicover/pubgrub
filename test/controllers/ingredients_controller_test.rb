require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entree = entrees(:beet_pasta)
  end

  class AsAdmin < IngredientsControllerTest
    setup do
      login_as users(:jim)
    end

    test 'should get index' do
      GroceryList.create
      get ingredients_path
      assert_response :success
    end

    test 'should get single record' do
      get ingredient_path(ingredients(:one))
      assert_response :success
    end

    test 'should get new' do
      get new_ingredient_path
      assert_response :success
    end

    # test 'should create' do
    #   assert_difference('Ingredient.count') do
    #     post ingredients_path, params: {
    #       ingredient: {
    #         grocery: 'Cumin', quantity: 1.25, measurement: 'Teaspoon', meal_id: @entree.id
    #       }
    #     }
    #   end
    #   assert_redirected_to ingredients_path
    # end

    test 'should get edit' do
      get edit_ingredient_path(ingredients(:one))
      assert_response :success
    end

    test 'should update' do
      num = Faker::Number.number(digits: 3)
      patch ingredient_path(ingredients(:one)), params: {
        ingredient: {
          total_grams: num
        }
      }
      assert_equal num, ingredients(:one).reload.total_grams
      assert_redirected_to ingredient_path(ingredients(:one))
    end

    test 'should destroy' do
      assert_difference('Ingredient.count', -1) do
        delete ingredient_path(ingredients(:one))
      end
      assert_redirected_to ingredients_path
    end

    test 'link should change simple status' do
      ingredient = ingredients(:one)
      assert ingredient.out_of_stock?
      get update_single_status_ingredient_path(ingredient)
      assert ingredient.reload.in_stock?
      get update_single_status_ingredient_path(ingredient)
      assert ingredient.reload.out_of_stock?
    end

    test 'link should change complex status' do
      ingredient = ingredients(:one)
      assert ingredient.out_of_stock?
      get update_single_status_ingredient_path(ingredient)
      assert ingredient.reload.in_stock?
      get update_single_status_ingredient_path(ingredient)
      assert ingredient.reload.out_of_stock?
    end
  end

  class AsMember < IngredientsControllerTest
    setup do
      login_as users(:dave)
    end

    test 'should not get index' do
      assert_raises(Pundit::NotAuthorizedError) {
        get ingredients_path
      }
    end

    test 'should not get single record' do
      assert_raises(Pundit::NotAuthorizedError) {
        get ingredient_path(ingredients(:one))
      }
    end

    test 'should not get new' do
      assert_raises(Pundit::NotAuthorizedError) {
        get new_ingredient_path
      }
    end

    # test 'should not create' do
    #   assert_raises(Pundit::NotAuthorizedError) {
    #     post ingredients_path, params: {
    #       ingredient: {
    #         grocery: 'thing', quantity: 1.00, meal_id: @entree.id
    #       }
    #     }
    #   }
    # end

    test 'should not get edit' do
      assert_raises(Pundit::NotAuthorizedError) {
        get edit_ingredient_path(ingredients(:one))
      }
    end

    test 'should not update' do
      assert_raises(Pundit::NotAuthorizedError) {
        patch ingredient_path(ingredients(:one)), params: {
          grocery: 'meat'
        }
      }
    end

    test 'should not destroy' do
      assert_raises(Pundit::NotAuthorizedError) {
        delete ingredient_path(ingredients(:one))
      }
    end
  end
end
