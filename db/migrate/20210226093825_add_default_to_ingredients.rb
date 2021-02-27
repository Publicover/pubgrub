class AddDefaultToIngredients < ActiveRecord::Migration[6.1]
  def change
    remove_column :ingredients, :measurement, :string
    add_column :ingredients, :measurement, :string, default: "Whole"
  end
end
