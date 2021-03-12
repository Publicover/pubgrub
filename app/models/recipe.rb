# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_rich_text :body

  belongs_to :user, inverse_of: :recipes
  belongs_to :entree, inverse_of: :recipe

  before_save :set_name

  def set_name
    assign_attributes(name: entree.name)
  end

  def ingredients
    entree.ingredients
  end
end
