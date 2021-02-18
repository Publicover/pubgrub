# frozen_string_literal: true

class Ingredient < ApplicationRecord
  include Ingredientable

  belongs_to :ingredientable, polymorphic: true, inverse_of: :ingredientable

  validates :grocery, presence: true

  delegate :name, to: :ingredientable
end
