class RemoveEntreeIndexFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_index :recipes, name: 'index_recipes_on_entree_id'
  end
end
