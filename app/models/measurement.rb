# frozen_string_literal: true

class Measurement < ApplicationRecord
  before_save :titleize_measure
end
