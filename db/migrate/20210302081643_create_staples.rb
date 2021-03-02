class CreateStaples < ActiveRecord::Migration[6.1]
  def change
    create_table :staples do |t|
      t.string :name
      t.string :measurement
      t.integer :quantity
      t.integer :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
