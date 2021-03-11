require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test 'should know user' do
    assert_equal recipes(:one).user, users(:jim)
  end

  test 'should know entree' do
    assert_equal recipes(:one).entree, entrees(:one)
  end
end
