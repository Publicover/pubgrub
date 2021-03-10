class AddCaloriesPerGramToGroceries < ActiveRecord::Migration[6.1]
  def change
    add_column :groceries, :calories_per_gram, :decimal, precision: 5, scale: 2
    add_column :groceries, :calories_per_package, :integer
    add_column :groceries, :grams_per_package, :integer
  end
end
