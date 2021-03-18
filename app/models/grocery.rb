# frozen_string_literal: true

class Grocery < ApplicationRecord
  before_save :titleize_name

  has_many :ingredients, inverse_of: :grocery, dependent: :destroy
  has_many :staples, inverse_of: :grocery, dependent: :destroy

  validates :name, uniqueness: true
end
