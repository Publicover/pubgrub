class CreateIngredients < ActiveRecord::Migration[6.1]
  def change
    create_table :ingredients do |t|
      t.decimal :quantity, precision: 5, scale: 2
      t.string :grocery
      t.string :measurement
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
