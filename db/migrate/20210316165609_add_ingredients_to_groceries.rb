class AddIngredientsToGroceries < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :grocery, :string
    add_reference :ingredients, :grocery, null: false, foreign_key: true
  end
end
