require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  class AsAdmin < UsersControllerTest
    setup do
      login_as users(:jim)
    end

    test 'should get index' do
      get users_path
      assert_response :success
    end

    test 'should get single record' do
      get user_path(users(:dana))
      assert_response :success
    end

    test 'should get edit' do
      get edit_user_path(users(:dave))
      assert_response :success
    end

    test 'should update' do
      name = Faker::Lorem.word
      patch user_path(users(:dave)), params: { user: {
        fname: name
        }
      }
      assert_equal name, users(:dave).reload.fname
    end

    test 'should destroy' do
      assert_difference('User.count', -1) do
        delete user_path(users(:dave))
      end
    end
  end

  class AsUser < UsersControllerTest

  end
end
