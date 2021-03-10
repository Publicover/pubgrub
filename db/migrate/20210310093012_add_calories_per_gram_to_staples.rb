class AddCaloriesPerGramToStaples < ActiveRecord::Migration[6.1]
  def change
    add_column :staples, :calories_per_gram, :decimal, precision: 5, scale: 2
    add_column :staples, :calories_per_package, :integer
    add_column :staples, :grams_per_package, :integer
  end
end
