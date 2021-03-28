# frozen_string_literal: true

class BuildMeals
  def initialize(entree)
    @entree = entree
  end

  def perform
    qualify_sides_by_category.each do |ids|
      Meal.create(entree: @entree, side_ids: ids)
    end
  end

  def collect_sides
    side_ids = Array.new
    @entree.side_category_ids.each do |id|
      side_ids << Side.where(side_category_id: id).pluck(:id)
    end
    side_ids.flatten
  end

  def qualify_sides_by_category
    side_combinations = collect_sides.combination(@entree.number_of_sides).to_a.sort
    side_combinations.each do |combo|
      combo_category_ids = Array.new
      combo.each do |id|
        combo_category_ids << Side.find(id).side_category_id
      end
      side_combinations.delete(combo) if combo_category_ids.uniq.size == 1
    end
  end
end
