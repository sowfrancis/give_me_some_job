class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.references :user, index: true, foreign_key: true
      t.references :job, index: true, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
