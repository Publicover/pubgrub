# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user, inverse_of: :recipes
  belongs_to :entree, inverse_of: :recipe

  before_save :set_name

  def set_name
    assign_attributes(name: entree.name)
  end
end
