class CreateCandidacies < ActiveRecord::Migration
  def change
    create_table :candidacies do |t|
      t.references :job
      t.references :user

      t.timestamps null: false
    end
  end
end
