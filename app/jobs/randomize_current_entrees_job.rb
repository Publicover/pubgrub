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

      if entree.side_category_ids.uniq == 1
        entree.assign_new_sides_from_one_category
      else
        entree.assign_new_sides
      end
      entree.sides.each(&:current!)
    end
    GroceryList.create!
  end
end
