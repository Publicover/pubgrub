require "test_helper"

class MealTest < ActiveSupport::TestCase
  setup do
    prepare_meals
  end

  test 'should have columns' do
    assert Meal.column_names.include?('entree_id')
    assert Meal.column_names.include?('side_ids')
  end

  test 'should know sides' do
    refute meals(:one).sides.empty?
  end
end
