class AddStatusToGroceryLists < ActiveRecord::Migration[6.1]
  def change
    add_column :grocery_lists, :status, :integer, default: 0
  end
end
