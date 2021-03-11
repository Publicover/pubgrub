# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :user, inverse_of: :recipes
  belongs_to :entree, inverse_of: :recipe
end
