class AddCalorieGoalToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :calorie_goal, :integer
  end
end
