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
      assert_redirected_to user_path(users(:dave))
    end

    test 'should destroy' do
      assert_difference('User.count', -1) do
        delete user_path(users(:dave))
      end
      assert_redirected_to users_path
    end
  end

  class AsMember < UsersControllerTest
    setup do
      login_as users(:dave)
    end

    test 'should not get index' do
      assert_raises(Pundit::NotAuthorizedError) {
        get users_path
      }
    end

    test 'should not get another record' do
      assert_raises(Pundit::NotAuthorizedError) {
        get user_path(users(:jim))
      }
    end

    test 'should get own record' do
      get user_path(users(:dave))
      assert_response :success
    end

    test 'should not get edit for another record' do
      assert_raises(Pundit::NotAuthorizedError) {
        get edit_user_path(users(:jim))
      }
    end

    test 'should get edit for own record' do
      get edit_user_path(users(:dave))
    end

    test 'should not update another record' do
      name = Faker::Lorem.word
      assert_raises(Pundit::NotAuthorizedError) {
        patch user_path(users(:jim)), params: {
          user: {
            fname: name
          }
        }
      }
    end

    test 'should update own record' do
      name = Faker::Lorem.word
      patch user_path(users(:dave)), params: {
        user: {
          fname: name
        }
      }
      assert_equal name, users(:dave).reload.fname
      assert_redirected_to user_path(users(:dave))
    end

    test 'should not destroy another record' do
      assert_raises(Pundit::NotAuthorizedError) {
        delete user_path(users(:jim))
      }
    end

    test 'should destroy own record' do
      assert_difference('User.count', -1) do
        delete user_path(users(:dave))
      end
      assert_redirected_to users_path
    end
  end
end
