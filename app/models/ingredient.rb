# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :ingredientable, polymorphic: true

  validates :grocery, presence: true

  delegate :name, to: :ingredientable, prefix: true

  scope :current_with_entree, lambda {
    joins(
      "JOIN entrees ON entrees.id = ingredients.ingredientable_id
       AND ingredients.ingredientable_type = 'Entree'"
    )
  }

  scope :current_with_side, lambda {
    joins(
      "JOIN sides ON sides.id = ingredients.ingredientable_id
       AND ingredients.ingredientable_type = 'Side'"
    )
  }

  enum status: {
    in_stock: 0,
    out_of_stock: 1
  }
end
