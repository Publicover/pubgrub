require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  test 'should have correct columns' do
    assert Recipe.column_names.include?('name')
    assert Recipe.column_names.include?('user_id')
    assert Recipe.column_names.include?('recipeable_id')
    assert Recipe.column_names.include?('recipeable_type')
  end

  test 'should know user' do
    assert_equal recipes(:one).user, users(:jim)
  end

  test 'should know entree' do
    assert_equal recipes(:one).recipeable, entrees(:one)
  end

  test 'should take entree name before save' do
    assert_difference('Recipe.count') do
      Recipe.create!(user_id: users(:jim).id, recipeable_id: entrees(:one).id, recipeable_type: 'Entree')
    end
    assert_equal Recipe.last.name, entrees(:one).name
  end

  test 'should know ingredients' do
    assert_equal recipes(:one).ingredients, entrees(:one).ingredients
  end
end
