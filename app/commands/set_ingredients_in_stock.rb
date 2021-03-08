# frozen_string_literal: true

class SetIngredientsInStock
  def perform
    Ingredient.out_of_stock.each(&:in_stock!)
    Staple.out_of_stock.each(&:in_stock!)
  end
end
