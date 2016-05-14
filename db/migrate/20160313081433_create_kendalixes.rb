class CreateKendalixes < ActiveRecord::Migration
  def change
    create_table :kendalixes do |t|
      t.integer :nilai

      t.timestamps null: false
    end
  end
end
