class GroceryListsController < ApplicationController
  def finished_shopping
    SetIngredientsInStock.new.perform
    redirect_to ingredients_path, notice: 'Nice.'
  end
end
