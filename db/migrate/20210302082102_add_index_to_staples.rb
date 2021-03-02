class AddIndexToStaples < ActiveRecord::Migration[6.1]
  def change
    add_index :staples, :name, unique: true
  end
end
