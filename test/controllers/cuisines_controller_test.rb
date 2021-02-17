require "test_helper"

class CuisinesControllerTest < ActionDispatch::IntegrationTest
  class AsAdmin < CuisinesControllerTest
    setup do
      login_as users(:jim)
    end

    test 'should get index' do
      get cuisines_path
      assert_response(:success)
    end

    test 'should get single record' do
      get cuisine_path(cuisines(:american))
      assert_response(:success)
    end

    test 'should get new' do
      get new_cuisine_path
      assert_response(:success)
    end

    test 'should create cuisines' do
      name = Faker::Lorem.word
      assert_difference('Cuisine.count') do
        post cuisines_path, params: { cuisine: {
            name: name
          }
        }
      end
      assert_redirected_to cuisines_path
    end

    test 'should get edit' do
      get edit_cuisine_path(cuisines(:american))
      assert_response(:success)
    end

    test 'should update and titleize cuisine' do
      name = Faker::Lorem.word
      patch cuisine_path(cuisines(:american)), params: {
        cuisine: {
          name: name
        }
      }
      assert_equal name.titleize, cuisines(:american).reload.name
      assert_redirected_to cuisine_path(cuisines(:american))
    end

    test 'should destroy cuisine' do
      assert_difference('Cuisine.count', -1) do
        delete cuisine_path(cuisines(:american))
      end
      assert_redirected_to cuisines_path
    end
  end

  class AsMember < CuisinesControllerTest
    setup do
      login_as users(:dave)
    end

    test 'should get index' do
      get cuisines_path
      assert_response(:success)
    end

    test 'should get show' do
      get cuisine_path(cuisines(:american))
      assert_response(:success)
    end

    test 'should not get new' do
      assert_raises(Pundit::NotAuthorizedError) {
        get new_cuisine_path
      }
    end

    test 'should not create' do
      name = Faker::Lorem.word
      assert_raises(Pundit::NotAuthorizedError) {
        post cuisines_path, params: { cuisine: {
            name: name
          }
        }
      }
    end

    test 'should not get edit' do
      assert_raises(Pundit::NotAuthorizedError) {
        get edit_cuisine_path(cuisines(:american))
      }
    end

    test 'should not update' do
      name = Faker::Lorem.word
      assert_raises(Pundit::NotAuthorizedError) {
        patch cuisine_path(cuisines(:american)), params: {
          cuisine: {
            name: name
          }
        }
      }
    end

    test 'should not destroy' do
      assert_raises(Pundit::NotAuthorizedError) {
        delete cuisine_path(cuisines(:american))
      }
    end
  end
end
