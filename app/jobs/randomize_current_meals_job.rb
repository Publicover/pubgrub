class RandomizeCurrentMealsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Meal.current.each do |meal|
      meal.archived!
    end
    Meal.pluck(:id).sample(7).each do |id|
      Meal.find(id).current!
    end
  end
end
