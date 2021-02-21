# frozen_string_literal: true

class SideCategory < ApplicationRecord
  before_save :tileize_name

  has_many :sides, inverse_of: :side_category, dependent: :destroy

  validates :name, uniqueness: true
end
