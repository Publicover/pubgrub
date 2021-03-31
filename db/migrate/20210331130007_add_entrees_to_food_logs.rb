class AddEntreesToFoodLogs < ActiveRecord::Migration[6.1]
  def change
    add_reference :food_logs, :entree, null: false, foreign_key: true
  end
end
