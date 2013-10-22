$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_showcase_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_showcase_admin"
  s.version     = SimpleShowcaseAdmin::VERSION
  s.authors     = ["Ben Woodward"]
  s.email       = ["b@benw.me"]
  s.files = `git ls-files`.split("\n")
  # s.homepage    = "TODO"
  s.summary     = "A very simple Rails backend to manage categories and items."
  s.description = "SimpleShowcaseAdmin includes all the necessary logic to create a basic admin panel that allows for reorderable items that are grouped into categories. It does not include any frontend code."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', ['>= 3.1.10', '< 3.3'] | 0.upto(10).map{|i| "!= 3.2.#{i}"}
  s.add_dependency 'simple_form'
  s.add_dependency "sorcery", '~> 0.8'
  s.add_dependency 'friendly_id', '~> 4.0', '>= 4.0.9'
  s.add_dependency "jquery-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "haml"
  s.add_dependency 'kaminari', '~> 0.14'
  s.add_dependency 'carrierwave'
  s.add_dependency 'rmagick'
  s.add_dependency 'compass-rails'
  s.add_dependency 'compass_twitter_bootstrap'
  s.add_dependency 'redcarpet'
  s.add_dependency 'ranked-model'

  s.add_development_dependency 'rspec-rails', '~> 2.13'
  s.add_development_dependency "sqlite3"
end

