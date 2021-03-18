# frozen_string_literal: true

class CalculateCalories
  def perform(obj)
    save_calories_per_gram(obj)
  end

  def save_calories_per_gram(obj)
    obj.update(calories_per_gram: calculate_calories_per_gram(obj))
  end

  def calculate_calories_per_gram(obj)
    return 0 if obj.ingredients.blank?
    return 0 if obj.ingredients.pluck(:total_grams).include?(nil)

    calories = []
    grams = obj.ingredients.sum(:total_grams) * 1.0
    obj.ingredients.each do |ingredient|
      calories << ingredient.calories_per_gram * ingredient.total_grams
    end
    (calories.inject(0) { |sum, x| sum + x } / grams).round(2)
  end
end
