class DropMeals < ActiveRecord::Migration[6.1]
  def change
    drop_table :meals
  end
end
