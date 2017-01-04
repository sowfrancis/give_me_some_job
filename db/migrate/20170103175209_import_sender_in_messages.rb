require_relative "../../lib/message_sender_migration"

class ImportSenderInMessages < ActiveRecord::Migration

  def change
  	MessageSenderMigration.sender_message
  end
end
