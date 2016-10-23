class AddRecruiterReferencesToTags < ActiveRecord::Migration
  def change
    add_reference :tags, :recruiter, index: true, foreign_key: true
  end
end
