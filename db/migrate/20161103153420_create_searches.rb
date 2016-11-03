class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
    	t.references :job
    	t.references :tag

      t.timestamps null: false
    end
  end
end
