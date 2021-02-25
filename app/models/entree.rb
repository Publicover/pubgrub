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

    side_ids = Array.new
    side_category_ids&.each do |id|
      category = SideCategory.find(id)
      next if category.sides.nil?
      side_ids << category.sides.pluck(:id).sample
    end
    update(present_sides: side_ids)
  end
end
