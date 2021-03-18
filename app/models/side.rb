# frozen_string_literal: true

class Side < ApplicationRecord
  include Ingredientable
  include Recipeable

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  has_one_attached :pic

  before_save :titleize_name

  belongs_to :user, inverse_of: :sides
  belongs_to :side_category, inverse_of: :sides

  delegate :name, to: :side_category, prefix: true

  scope :with_no_recipes, -> { includes(:recipe).where(recipes: { id: nil }).order(name: :asc) }

  enum status: {
    archived: 0,
    current: 1
  }
end
