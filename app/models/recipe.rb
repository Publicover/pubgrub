# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :recipeable, polymorphic: true

  has_rich_text :body

  belongs_to :user, inverse_of: :recipes

  before_save :set_name

  delegate :ingredients, to: :recipeable

  def set_name
    assign_attributes(name: recipeable.name)
  end

  def set_calories_per_gram
    calculate_calories_per_gram.inject(0) { |sum, x| sum + x }
  end

  def calculate_calories_per_gram
    ingredients.each_with_object([]) do |ingredient, memo|
      memo << (ingredient.total_grams * grocery.calories_per_gram)
    end
  end
end
