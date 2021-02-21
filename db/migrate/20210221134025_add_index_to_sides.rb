class AddIndexToSides < ActiveRecord::Migration[6.1]
  def change
    add_index :sides, :name, unique: true
  end
end
