module SimpleShowcaseAdmin
  class Engine < ::Rails::Engine
    isolate_namespace SimpleShowcaseAdmin
    engine_name 'simple_showcase_admin'

    initializer "simple_showcase_admin.configuration", :before => :load_config_initializers do |app|
      app.config.simple_showcase_admin = SimpleShowcaseAdmin::Configuration.new
      SimpleShowcaseAdmin::Config = app.config.simple_showcase_admin
    end
  end
end

require 'simple_form'
require 'sorcery'
require 'haml'
require 'kaminari'
require 'carrierwave'
require 'RMagick'
require 'compass-rails'
require 'compass_twitter_bootstrap'
require 'redcarpet'
require 'ranked-model'
require 'jquery-ui-rails'
require 'rails-settings-cached'
