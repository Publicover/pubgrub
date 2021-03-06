# frozen_string_literal: true

class RandomizeCurrentEntreesJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Entree.clear_present_sides
    Entree.current.each(&:archived!)
    Entree.pluck(:id).sample(7).each do |id|
      entree = Entree.find(id)
      entree.current!
    end
    Entree.current.each do |entree|
      next if entree.number_of_sides.zero?

      sort_sides(entree)
      entree.sides.each(&:current!)
    end
    GroceryList.create!
  end

  def sort_sides(entree)
    if entree.side_category_ids.uniq == [entree.side_category_ids[0]]
      entree.assign_new_sides_from_one_category
    else
      entree.assign_new_sides
    end
  end
end
