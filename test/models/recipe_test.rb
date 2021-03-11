require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test 'should know user' do
    assert_equal recipes(:one).user, users(:jim)
  end

  test 'should know entree' do
    assert_equal recipes(:one).entree, entrees(:one)
  end

  test 'should take entree name before save' do
    assert_difference('Recipe.count') do
      Recipe.create(user_id: users(:jim).id, entree_id: entrees(:one).id)
    end
    assert_equal Recipe.last.name, entrees(:one).name
  end
end
