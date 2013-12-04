module SimpleShowcaseAdmin
  class Photo < ActiveRecord::Base
    attr_accessible :image, :featured, :landscape
    mount_uploader :image, SimpleShowcaseAdmin::ImageUploader
    before_save :reset_featured_post, :if => :featured_changed?

    def reset_featured_post
      if self.featured?
        Photo.update_all :featured => false
      end
    end
  end
end
