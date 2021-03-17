class DashboardsController < ApplicationController
  def index
    @grocery_list = GroceryList.current.last
    @entrees = Entree.current
    @ingredients = Ingredient.all
    @ingredient = Ingredient.first
  end
end
