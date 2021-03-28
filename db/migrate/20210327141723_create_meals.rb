class CreateMeals < ActiveRecord::Migration[6.1]
  def change
    create_table :meals do |t|
      t.references :entree, null: false, foreign_key: true
      t.integer :side_ids, array: true, default: []

      t.timestamps
    end
  end
end
