require 'test_helper'

class MealTest < ActiveSupport::TestCase
  test 'should validate name' do
    meal = Meal.create(cuisine: 'American')
    assert_not meal.save
    assert_not_nil meal.errors[:line1]
  end

  test 'should validate cuisine' do
    meal = Meal.create(name: 'Mac N Cheese')
    assert_not meal.save
    assert_not_nil meal.errors[:line1]
  end
end
