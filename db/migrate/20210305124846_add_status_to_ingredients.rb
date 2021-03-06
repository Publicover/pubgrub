class AddStatusToIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :ingredients, :status, :integer, default: 1
  end
end
