class AddStaplesToGroceries < ActiveRecord::Migration[6.1]
  def change
    remove_column :staples, :name, :string
    remove_column :staples, :calories_per_gram, :decimal, precision: 5, scale: 2
    add_reference :staples, :grocery, null: false, foreign_key: true
  end
end
