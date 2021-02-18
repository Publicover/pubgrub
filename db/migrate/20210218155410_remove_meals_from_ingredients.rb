class RemoveMealsFromIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :meal_id, :integer
  end
end
