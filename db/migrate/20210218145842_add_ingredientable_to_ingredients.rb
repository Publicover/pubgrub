class AddIngredientableToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_reference :ingredients, :ingredientable, polymorphic: true, null: false, index: true
  end
end
