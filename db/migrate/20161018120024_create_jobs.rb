class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string :name
    	t.text :description
    	t.string :jobimg

      t.timestamps null: false
    end
  end
end
