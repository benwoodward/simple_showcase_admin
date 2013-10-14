require 'friendly_id'

module SimpleShowcaseAdmin
  class Item < ActiveRecord::Base
    belongs_to :category
    has_many :photos, dependent: :destroy
    accepts_nested_attributes_for :photos, reject_if: proc { |a| a[:id].blank? && a[:image].blank? }, allow_destroy: true
    attr_accessible :photos_attributes, :title, :description

    extend FriendlyId
    friendly_id :title, use: :slugged

    validates_presence_of :title
    validates_presence_of :description

    validates_uniqueness_of :title

    before_validation :format

    def format
      self.title = self.title.downcase.titleize
    end
  end
end
