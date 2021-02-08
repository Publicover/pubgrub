class AddStatusToMeals < ActiveRecord::Migration[6.1]
  def change
    add_column :meals, :status, :integer, default: 0
  end
end
