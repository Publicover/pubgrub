class CreateSides < ActiveRecord::Migration[6.1]
  def change
    create_table :sides do |t|
      t.string :name
      t.integer :status, default: 0
      t.references :user, null: false, foreign_key: true
      t.references :side_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
