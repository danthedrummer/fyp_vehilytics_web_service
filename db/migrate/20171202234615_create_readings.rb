class CreateReadings < ActiveRecord::Migration[5.1]
  def change
    create_table :readings do |t|
      t.string :sensor_name
      t.numeric :range_min
      t.numeric :range_max
      t.string :unit
      t.numeric :value
      t.string :device_id

      t.timestamps
    end
  end
end
