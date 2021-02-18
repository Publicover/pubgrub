# frozen_string_literal: true

class SideCategory < ApplicationRecord
  before_save :tileize_name

  validates :name, uniqueness: true

  def tileize_name
    self.name = name.titleize
  end
end
