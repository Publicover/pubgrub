require 'test_helper'

class BuildMealsTest < ActiveSupport::TestCase
  setup do
    @entree = Entree.create!(name: 'Fake', number_of_sides: 2,
                             side_category_ids: [side_categories(:starch).id, side_categories(:vegetable).id],
                             status: :current,
                             cuisine_id: Cuisine.pluck(:id).sample,
                             user_id: users(:jim).id)
  end

  test 'should get a flat array of side ids' do
    ary = BuildMeals.new(@entree).collect_sides
    refute ary.empty?
  end

  test 'should combine unique sides' do
    ary = BuildMeals.new(@entree).qualify_sides_by_category
    refute ary.empty?
  end

  test 'should build meals' do
    # a little brittle, yeah, but i need to predict the outcome since each entree
    # can return a different number of meals
    assert_difference('Meal.count', 4) do
      BuildMeals.new(@entree).perform
    end
  end
end
