# frozen_string_literal: true

class RandomizeCurrentMealsJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Meal.current.each(&:archived!)
    Meal.pluck(:id).sample(7).each do |id|
      Meal.find(id).current!
    end
  end
end
