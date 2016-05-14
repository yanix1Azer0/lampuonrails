class AddStatusToAktuators < ActiveRecord::Migration
  def change
    add_column :aktuators, :status, :string
  end
end
