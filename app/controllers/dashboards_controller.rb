class DashboardsController < ApplicationController
  def index
    @grocery_list = GroceryList.current.last
    @meals = Meal.current
  end
end
