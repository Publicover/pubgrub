# frozen_string_literal: true

class Grocery < ApplicationRecord
  before_save :tileize_name

  validates :name, uniqueness: true
end
