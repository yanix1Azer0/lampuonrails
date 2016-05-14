class CreateAktuators < ActiveRecord::Migration
  def change
    create_table :aktuators do |t|
      t.string :nama
      t.string :deskripsi
      t.string :jenis
      t.integer :watt

      t.timestamps null: false
    end
  end
end
