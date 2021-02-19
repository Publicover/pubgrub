class DashboardsController < ApplicationController
  def index
    @grocery_list = GroceryList.current.last
    @entrees = Entree.current
  end
end
