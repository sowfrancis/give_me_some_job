class RemoveJobIdFromTag < ActiveRecord::Migration
  def change
    remove_column :tags, :job_id, :integer
  end
end
