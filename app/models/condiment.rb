class Condiment < ApplicationRecord
  before_save :titleize_name
end
