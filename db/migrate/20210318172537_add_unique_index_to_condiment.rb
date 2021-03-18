class AddUniqueIndexToCondiment < ActiveRecord::Migration[6.1]
  def change
    add_index :condiments, :name, unique: true
  end
end
