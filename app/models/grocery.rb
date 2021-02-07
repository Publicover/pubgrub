class Grocery < ApplicationRecord
  before_save :tileize_name

  validates :name, uniqueness: true

  def tileize_name
    self.name = self.name.titleize
  end
end
