class DashboardsController < ApplicationController
  def index
    @grocery_list = GroceryList.current.last
    @entrees = Entree.current
    @ingredients = Ingredient.all
    @ingredient = Ingredient.first
  end

  # def update_status
  #   binding.pry
  #   if @ingredient.in_stock?
  #     @ingredient.update(status: :out_of_stock)
  #   elsif @ingredient.out_of_stock?
  #     @ingredient.update(status: :in_stock)
  #   end
  # end
end
