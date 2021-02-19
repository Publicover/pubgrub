class Entree < ApplicationRecord
  include Ingredientable
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  has_one_attached :pic

  before_save :tileize_name

  belongs_to :cuisine, inverse_of: :entrees
  belongs_to :user, inverse_of: :entrees

  validates :name, uniqueness: true
  validates :number_of_sides, presence: true

  enum status: {
    archived: 0,
    current: 1
  }
end
