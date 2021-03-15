# frozen_string_literal: true

class Recipe < ApplicationRecord
  belongs_to :recipeable, polymorphic: true

  has_rich_text :body

  belongs_to :user, inverse_of: :recipes

  before_save :set_name

  delegate :ingredients, to: :recipeable

  def set_name
    assign_attributes(name: recipeable.name)
  end
end
