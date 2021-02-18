require "test_helper"

class IngredientsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meal = meals(:beet_pasta)
  end

  class AsAdmin < IngredientsControllerTest
    setup do
      login_as users(:jim)
    end

    test 'should get index' do
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
    #         grocery: 'Cumin', quantity: 1.25, measurement: 'Teaspoon', meal_id: @meal.id
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
      word = Faker::Lorem.word
      patch ingredient_path(ingredients(:one)), params: {
        ingredient: {
          grocery: word
        }
      }
      assert_equal word, ingredients(:one).reload.grocery
      assert_redirected_to ingredient_path(ingredients(:one))
    end

    test 'should destroy' do
      assert_difference('Ingredient.count', -1) do
        delete ingredient_path(ingredients(:one))
      end
      assert_redirected_to ingredients_path
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
    #         grocery: 'thing', quantity: 1.00, meal_id: @meal.id
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
