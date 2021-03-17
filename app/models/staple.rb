# frozen_string_literal: true

class Staple < ApplicationRecord
  has_one_attached :pic

  belongs_to :user, inverse_of: :staples
  belongs_to :grocery, inverse_of: :staples
  belongs_to :measurement, inverse_of: :staples

  validates :name, presence: true

  enum status: {
    in_stock: 0,
    out_of_stock: 1
  }

  delegate :name, to: :grocery
  delegate :calories_per_gram, to: :grocery
  delegate :measure, to: :measurement

  def pretty_calories_per_gram
    calories_per_gram == calories_per_gram.to_i ? calories_per_gram.to_i : calories_per_gram
  end
end
