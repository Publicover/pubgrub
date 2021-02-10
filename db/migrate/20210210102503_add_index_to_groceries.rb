class AddIndexToGroceries < ActiveRecord::Migration[6.1]
  def change
    add_index :groceries, :name, unique: true
  end
end
