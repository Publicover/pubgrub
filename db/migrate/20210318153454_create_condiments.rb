class CreateCondiments < ActiveRecord::Migration[6.1]
  def change
    create_table :condiments do |t|
      t.string :name
      t.decimal :calories_per_gram, precision: 4, scale: 2

      t.timestamps
    end
  end
end
