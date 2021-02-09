class DashboardsController < ApplicationController
  def index
    @grocery_list = GroceryList.current.last
  end
end
