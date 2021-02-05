class Meal < ApplicationRecord
  has_one_attached :pic

  belongs_to :user, inverse_of: :meals

  validates :name, :cuisine, presence: true
end
