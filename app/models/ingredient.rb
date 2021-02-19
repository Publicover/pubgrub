# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :ingredientable, polymorphic: true

  validates :grocery, presence: true
end
