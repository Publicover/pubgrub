class AddStaplesToMeasurements < ActiveRecord::Migration[6.1]
  def change
    remove_column :staples, :measurement, :string
    add_reference :staples, :measurement, null: false, foreign_key: true
  end
end
