class AddNamaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nama, :string
  end
end
