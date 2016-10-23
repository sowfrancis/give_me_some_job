class AddLatitudeAndLongitudeToRecruiter < ActiveRecord::Migration
  def change
    add_column :recruiters, :latitude, :float
    add_column :recruiters, :longitude, :float
  end
end
