class CreateItems < ActiveRecord::Migration
  def change
    create_table :simple_showcase_admin_items do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
