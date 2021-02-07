class Ingredient < ApplicationRecord
  belongs_to :meal, inverse_of: :ingredients

  validates :grocery, presence: true
end
