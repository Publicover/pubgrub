class Measurement < ApplicationRecord
  before_save :titleize_measure

  def titleize_measure
    self.measure = self.measure.titleize
  end
end
