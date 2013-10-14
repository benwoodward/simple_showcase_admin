require 'friendly_id'

module SimpleShowcaseAdmin
  class User < ActiveRecord::Base
    attr_accessible :first_name, :email, :password, :password_confirmation, :slug
    authenticates_with_sorcery!

    extend FriendlyId
    friendly_id :first_name, use: :slugged

    before_save :format_attributes

    validates_presence_of :first_name
    validates_presence_of :email
    validates_presence_of :password, on: :create
    validates_confirmation_of :password
    validates_confirmation_of :email, on: :update
    validates_length_of :password, minimum: 6

    def format_attributes
      self.email = self.email.downcase
      self.first_name = self.first_name.titleize
    end
  end
end
