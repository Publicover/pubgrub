class FoodLog < ApplicationRecord
  belongs_to :user, inverse_of: :food_logs
end
