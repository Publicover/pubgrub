class AddSideIdsToFoodLogs < ActiveRecord::Migration[6.1]
  def change
    add_column :food_logs, :side_ids, :integer, array: true, default: []
  end
end
