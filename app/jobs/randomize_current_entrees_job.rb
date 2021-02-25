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
      if entree.number_of_sides.zero?
        next
      else
        entree.assign_new_sides
        entree.sides.each { |side| side.current! }
      end
    end
  end
end
