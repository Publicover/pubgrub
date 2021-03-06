require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    GroceryList.create!
  end

  test 'should redirect if not logged in' do
    get root_path
    assert_redirected_to user_session_path
  end

  test 'should log in' do
    login_as users(:jim)
    get root_path
    assert_response :success
  end
end
