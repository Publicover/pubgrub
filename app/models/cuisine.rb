# frozen_string_literal: true

class Cuisine < ApplicationRecord
  before_save :tileize_name

  validates :name, uniqueness: true
end
