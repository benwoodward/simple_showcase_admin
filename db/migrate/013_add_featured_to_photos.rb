class AddFeaturedToPhotos < ActiveRecord::Migration
  def change
    add_column :simple_showcase_admin_photos, :featured, :boolean
  end
end
