class CreateRekamsensors < ActiveRecord::Migration
  def change
    create_table :rekamsensors do |t|
      t.integer :nilai
      t.integer :sensorid

      t.timestamps null: false
    end
    add_reference :rekamsensors, :sensor
  end
end
