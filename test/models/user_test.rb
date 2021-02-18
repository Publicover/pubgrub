require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'should have correct columns' do
    assert User.column_names.include?('email')
    assert User.column_names.include?('fname')
    assert User.column_names.include?('role')
  end

  test 'should know entrees' do
    assert_not_nil users(:jim).entrees
    assert_equal users(:jim).entrees, Entree.where(user_id: users(:jim).id)
  end
end
