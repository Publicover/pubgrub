class AddTotalGramsToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :total_grams, :integer
  end
end
