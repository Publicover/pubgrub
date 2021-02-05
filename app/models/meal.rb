class Meal < ApplicationRecord
  has_one_attached :pic

  belongs_to :user

  validates :name, :cuisine, presence: true
end
