class Meal < ApplicationRecord
  has_one_attached :pic

  belongs_to :user, inverse_of: :meals
  has_many :ingredients, inverse_of: :meal, dependent: :destroy
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  validates :name, :cuisine, presence: true

  enum status: {
    archived: 0,
    current: 1
  }
end
