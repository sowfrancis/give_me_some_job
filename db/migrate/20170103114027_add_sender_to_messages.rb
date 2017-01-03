class AddSenderToMessages < ActiveRecord::Migration
  def change
  	add_column :messages, :sender_id, :integer
  	add_column	:messages, :sender_type, :string

  	add_index :messages, [:sender_type, :sender_id]
  end

end
