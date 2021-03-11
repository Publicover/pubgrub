require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  class AsAdmin < RecipesControllerTest
    setup do
      login_as users(:jim)
    end

    test 'should get index' do
      get recipes_path
      assert_response :success
    end

    test 'should get single record' do
      get recipe_path(recipes(:one))
      assert_response :success
    end

    test 'should get new' do
      get new_recipe_path
      assert_response :success
    end

    test 'should get create' do
      assert_difference('Recipe.count') do
        post recipes_path, params: {
          recipe: {
            name: 'Steak',
            user_id: users(:jim).id,
            entree_id: entrees(:one).id
          }
        }
      end
      assert_redirected_to recipes_path
    end

    test 'should get edit' do
      get edit_recipe_path(recipes(:one))
      assert_response :success
    end

    # can't do an update on the name since there's a callback
    
    # test 'should update' do
    #   word = Faker::Lorem.word
    #   patch recipe_path(recipes(:one)), params: {
    #     recipe: {
    #       name: 'word'
    #     }
    #   }
    #   assert_equal 'word', recipes(:one).reload.name
    #   assert_redirected_to recipe_path(recipes(:one))
    # end

    test 'should destroy' do
      assert_difference('Recipe.count', -1) do
        delete recipe_path(recipes(:one))
      end
      assert_redirected_to recipes_path
    end
  end

  class AsMember < RecipesControllerTest
    setup do
      login_as users(:dave)
    end

    test 'should get index' do
      get recipes_path
      assert_response :success
    end

    test 'should get single record' do
      get recipe_path(recipes(:one))
      assert_response :success
    end

    test 'should not get new' do
      assert_raises(Pundit::NotAuthorizedError) {
        get new_recipe_path
      }
    end

    test 'should not create' do
      assert_raises(Pundit::NotAuthorizedError) {
        post recipes_path, params: {
          recipe: {
            name: 'Steak',
            user_id: users(:jim).id,
            entree_id: entrees(:one).id
          }
        }
      }
    end

    test 'should not get edit' do
      assert_raises(Pundit::NotAuthorizedError) {
        get edit_recipe_path(recipes(:one))
      }
    end

    test 'should not update' do
      word = Faker::Lorem.word
      assert_raises(Pundit::NotAuthorizedError) {
        patch recipe_path(recipes(:one)), params: {
          recipe: {
            name: word
          }
        }
      }
    end

    test 'should not destroy' do
      assert_raises(Pundit::NotAuthorizedError) {
        delete recipe_path(recipes(:one))
      }
    end
  end
end
