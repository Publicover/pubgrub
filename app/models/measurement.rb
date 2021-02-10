# frozen_string_literal: true

class Measurement < ApplicationRecord
  before_save :titleize_measure

  def titleize_measure
    self.measure = measure.titleize
  end
end
