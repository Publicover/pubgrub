# frozen_string_literal: true

module Ingredientable
  extend ActiveSupport::Concern

  included do
    has_many :ingredients, as: :ingredientable
  end
end
