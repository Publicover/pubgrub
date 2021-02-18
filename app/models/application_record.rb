# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def tileize_name
    self.name = name.titleize
  end

  def titleize_measure
    self.measure = measure.titleize
  end
end
