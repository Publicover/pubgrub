# frozen_string_literal: true

class Ingredient < ApplicationRecord  
  belongs_to :ingredientable, polymorphic: true

  validates :grocery, presence: true

  delegate :name, to: :ingredientable, prefix: true

  scope :current_with_entree, -> {
    self.joins(
      "JOIN entrees ON entrees.id = ingredients.ingredientable_id
       AND ingredients.ingredientable_type = 'Entree'"
    )
  }

  scope :current_with_side, lambda {
    self.joins(
      "JOIN sides ON sides.id = ingredients.ingredientable_id
       AND ingredients.ingredientable_type = 'Side'"
    )
  }
end
