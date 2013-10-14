module SimpleShowcaseAdmin
  class Engine < ::Rails::Engine
    isolate_namespace SimpleShowcaseAdmin
  end
end

require 'simple_form'
require 'sorcery'
require 'haml'
require 'kaminari'
require 'carrierwave'
require 'rmagick'
require 'compass-rails'
require 'compass_twitter_bootstrap'
require 'redcarpet'
