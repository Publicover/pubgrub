# frozen_string_literal: true

class Measurement < ApplicationRecord
  before_save :titleize_measure

  has_many :staples, inverse_of: :measurement, dependent: :destroy
end
