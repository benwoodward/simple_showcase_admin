class AddLandscapeToPhotos < ActiveRecord::Migration
  def change
    add_column :simple_showcase_admin_photos, :landscape, :boolean
  end
end
