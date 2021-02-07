class Meal < ApplicationRecord
  has_one_attached :pic

  belongs_to :user, inverse_of: :meals
  has_many :ingredients, inverse_of: :meal, dependent: :destroy

  validates :name, :cuisine, presence: true
end
