require "test_helper"

class RandomizeCurrentMealsJobTest < ActiveJob::TestCase
  test 'job can be queued' do
    assert_enqueued_jobs 0
    RandomizeCurrentMealsJob.perform_later
    assert_enqueued_jobs 1
  end

  test 'should change current meals' do
    current_meals_count = Meal.current.count
    current_meal_ids = Meal.current.pluck(:id)

    RandomizeCurrentMealsJob.perform_now
    assert_equal 7, Meal.current.count
    assert_not_equal current_meal_ids, Meal.current.pluck(:id)
  end
end
