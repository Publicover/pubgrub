class Side < ApplicationRecord
  include Ingredientable
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  has_one_attached :pic

  before_save :tileize_name

  belongs_to :user, inverse_of: :sides
  belongs_to :side_category, inverse_of: :sides

  enum status: {
    archived: 0,
    current: 1
  }
end
