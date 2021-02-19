class SwapMealIdsInGroceryList < ActiveRecord::Migration[6.1]
  def change
    remove_column :grocery_lists, :meal_ids, :integer, array: true, defualt: []
    add_column :grocery_lists, :entree_ids, :integer, array: true, default: []
  end
end
