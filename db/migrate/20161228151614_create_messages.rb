class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :job, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.references :recruiter, index: true, foreign_key: true
      t.text :content

      t.timestamps null: false
    end
  end
end
