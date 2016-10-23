class AddAddressToRecruiter < ActiveRecord::Migration
  def change
    add_column :recruiters, :address, :text
  end
end
