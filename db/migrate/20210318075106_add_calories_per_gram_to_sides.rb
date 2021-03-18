class AddCaloriesPerGramToSides < ActiveRecord::Migration[6.1]
  def change
    add_column :sides, :calories_per_gram, :decimal, precision: 4, scale: 2
  end
end
