# frozen_string_literal: true

class Grocery < ApplicationRecord
  before_save :tileize_name

  validates :name, uniqueness: true

  def tileize_name
    self.name = name.titleize
  end
end
