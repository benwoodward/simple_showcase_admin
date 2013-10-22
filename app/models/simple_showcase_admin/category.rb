require 'friendly_id'

module SimpleShowcaseAdmin
  class Category < ActiveRecord::Base
    attr_accessible :category, :slug, :row_order_position
    has_many :items, dependent: :destroy

    extend FriendlyId
    friendly_id :category, use: :slugged

    include RankedModel
    ranks :row_order

    validates_presence_of :category
    validates_uniqueness_of :category

    before_save :format

    def format
      self.category = self.category.titleize
    end
  end
end
