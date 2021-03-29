class CreateFoodLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :food_logs do |t|
      t.decimal :entree_calories, precision: 6, scale: 2
      t.decimal :side_calories, array: true, default: []
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
