class Meal < ApplicationRecord
  belongs_to :user

  validates :name, :cuisine, presence: true
end
