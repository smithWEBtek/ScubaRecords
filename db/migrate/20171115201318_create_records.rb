class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :date
      t.string :dive_time
      t.integer :max_depth
      t.integer :water_temperature
      t.string :activity
      t.text :notes
      t.timestamps
    end
  end
end
