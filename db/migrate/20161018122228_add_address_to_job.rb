class AddAddressToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :address, :text
  end
end
