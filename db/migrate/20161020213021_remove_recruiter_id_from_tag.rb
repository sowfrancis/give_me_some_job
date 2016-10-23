class RemoveRecruiterIdFromTag < ActiveRecord::Migration
  def change
    remove_column :tags, :recruiter_id, :integer
  end
end
