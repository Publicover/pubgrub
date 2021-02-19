# frozen_string_literal: true

class RandomizeCurrentEntreesJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    Entree.current.each(&:archived!)
    Entree.pluck(:id).sample(7).each do |id|
      Entree.find(id).current!
    end
  end
end
