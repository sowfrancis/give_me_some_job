class RemoveUserIdFromTag < ActiveRecord::Migration
  def change
    remove_column :tags, :user_id, :integer
  end
end
