class AddItemIdToPhotos < ActiveRecord::Migration
  def change
    add_column :simple_showcase_admin_photos, :item_id, :integer
  end
end
