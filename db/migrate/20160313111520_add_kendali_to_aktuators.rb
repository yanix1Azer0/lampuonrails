class AddKendaliToAktuators < ActiveRecord::Migration
  def change
    add_column :aktuators, :kendali, :string
  end
end
