class Staple < ApplicationRecord
  before_save :tileize_name
  
  belongs_to :user, inverse_of: :staples

  validates :name, presence: true

  enum status: {
    in_stock: 0,
    out_of_stock: 1
  }
end
