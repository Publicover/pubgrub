# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :ingredientable, polymorphic: true
  belongs_to :grocery, inverse_of: :ingredients

  validates :grocery, presence: true

  delegate :name, to: :ingredientable, prefix: true
  delegate :calories_per_gram, to: :grocery

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

  delegate :name, to: :grocery

  def flip_status
    if in_stock?
      update(status: :out_of_stock)
    elsif out_of_stock?
      update(status: :in_stock)
    end
  end

  def pretty_quantity
    quantity == quantity.to_i ? quantity.to_i : quantity
  end
end
