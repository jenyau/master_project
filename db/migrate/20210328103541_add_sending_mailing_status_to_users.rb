class AddSendingMailingStatusToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :mailing_status, :boolean, default: true
  end
end
