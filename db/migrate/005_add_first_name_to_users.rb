class AddFirstNameToUsers < ActiveRecord::Migration
  def change
    add_column :simple_showcase_admin_users, :first_name, :string

  end
end
