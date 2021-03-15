class AddRecipeableToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_reference :recipes, :recipeable, polymorphic: true, null: false, index: true
  end
end
