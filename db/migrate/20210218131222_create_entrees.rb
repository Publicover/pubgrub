class CreateEntrees < ActiveRecord::Migration[6.1]
  def change
    create_table :entrees do |t|
      t.string :name
      t.integer :number_of_sides
      t.integer :present_sides, array: true, default: []
      t.integer :side_category_ids, array: true, default: []
      t.integer :status, default: 0
      t.references :cuisine, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
