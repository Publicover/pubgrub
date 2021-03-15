# frozen_string_literal: true

module Recipeable
  extend ActiveSupport::Concern

  included do
    has_one :recipe, as: :recipeable, dependent: :destroy
  end
end
