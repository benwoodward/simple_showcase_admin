class SorceryCore < ActiveRecord::Migration
  def self.up
    create_table :simple_showcase_admin_users do |t|
      t.string :email,            :null => false
      t.string :crypted_password, :default => nil
      t.string :salt,             :default => nil

      t.timestamps
    end
  end

  def self.down
    drop_table :simple_showcase_admin_users
  end
end
