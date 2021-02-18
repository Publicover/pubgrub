class AddIndexToEntrees < ActiveRecord::Migration[6.1]
  def change
    add_index :entrees, :name, unique: true
  end
end
