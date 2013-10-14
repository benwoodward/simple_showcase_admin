require 'friendly_id'

module SimpleShowcaseAdmin
  class Category < ActiveRecord::Base
    attr_accessible :category, :slug
    has_many :items, dependent: :destroy

    extend FriendlyId
    friendly_id :category, use: :slugged

    validates_presence_of :category
    validates_uniqueness_of :category

    before_save :format

    def format
      self.category = self.category.titleize
    end
  end
end
