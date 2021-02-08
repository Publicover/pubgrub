class CreateGroceryLists < ActiveRecord::Migration[6.1]
  def change
    create_table :grocery_lists do |t|
      t.jsonb :grocery_quantity, null: true, default: {}
      t.integer :meal_ids, array: true, default: []

      t.timestamps
    end
  end
end
