# frozen_string_literal: true

class Staple < ApplicationRecord
  before_save :tileize_name

  has_one_attached :pic

  belongs_to :user, inverse_of: :staples

  validates :name, presence: true

  enum status: {
    in_stock: 0,
    out_of_stock: 1
  }

  def pretty_calories_per_gram
    calories_per_gram == calories_per_gram.to_i ? calories_per_gram.to_i : calories_per_gram
  end
end
