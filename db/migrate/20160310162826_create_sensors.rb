class CreateSensors < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.string :nama
      t.string :deskripsi
      t.string :jenis

      t.timestamps null: false
    end
  end
end
