require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'should know entrees' do
    assert_not_nil users(:jim).entrees
    assert_equal users(:jim).entrees, Entree.where(user_id: users(:jim).id)
  end
end
