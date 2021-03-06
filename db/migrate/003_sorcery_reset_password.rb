class SorceryResetPassword < ActiveRecord::Migration
  def self.up
    add_column :simple_showcase_admin_users, :reset_password_token, :string, :default => nil
    add_column :simple_showcase_admin_users, :reset_password_token_expires_at, :datetime, :default => nil
    add_column :simple_showcase_admin_users, :reset_password_email_sent_at, :datetime, :default => nil

    add_index :simple_showcase_admin_users, :reset_password_token
  end

  def self.down
    remove_index :simple_showcase_admin_users, :reset_password_token

    remove_column :simple_showcase_admin_users, :reset_password_email_sent_at
    remove_column :simple_showcase_admin_users, :reset_password_token_expires_at
    remove_column :simple_showcase_admin_users, :reset_password_token
  end
end
