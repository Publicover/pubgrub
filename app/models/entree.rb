# frozen_string_literal: true

class Entree < ApplicationRecord
  include Ingredientable
  include Recipeable

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  before_save :titleize_name

  has_one_attached :pic
  has_many :meals, inverse_of: :entree, dependent: :destroy
  has_many :food_logs, inverse_of: :entree, dependent: :destroy

  belongs_to :cuisine, inverse_of: :entrees
  belongs_to :user, inverse_of: :entrees

  validates :name, uniqueness: true
  validates :number_of_sides, presence: true

  scope :with_no_recipes, -> { includes(:recipe).where(recipes: { id: nil }).order(name: :asc) }

  enum status: {
    archived: 0,
    current: 1
  }

  def self.clear_present_sides
    current.each do |entree|
      entree.present_sides = []
      entree.save
    end
  end

  def sides
    return [] if present_sides.blank?
    return [] if number_of_sides.zero?

    Side.find(present_sides)
  end

  def assign_new_sides
    return if number_of_sides.zero?

    side_ids = []
    side_category_ids&.each do |id|
      category = SideCategory.find(id)
      next if category.sides.nil?

      side_ids << category.sides.pluck(:id).sample
    end
    update(present_sides: side_ids)
  end

  def assign_new_sides_from_one_category
    category = SideCategory.find(side_category_ids[0])
    return if category.sides.nil?

    side_ids = []
    potential_side_ids = category.sides.pluck(:id)
    number_of_sides.times do
      potential_side_id = potential_side_ids.sample
      side_ids << potential_side_id
      potential_side_ids.delete(potential_side_id)
    end
    update(present_sides: side_ids)
  end
end
