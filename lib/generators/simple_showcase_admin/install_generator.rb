require 'rails/generators'
module SimpleShowcaseAdmin
  module Generators
    class InstallGenerator < Rails::Generators::Base
      class_option "no-migrate", :type => :boolean

      source_root File.expand_path("../install/templates", __FILE__)
      desc "Used to install Simple Showcase Admin"

      def install_migrations
        puts "Copying over SimpleShowcaseAdmin migrations..."
        Dir.chdir(Rails.root) do
          `rake simple_showcase_admin:install:migrations`
        end
      end

      # def add_simple_showcase_admin_initializer
      #   path = "#{Rails.root}/config/initializers/simple_showcase_admin.rb"
      #   if File.exists?(path)
      #     puts "Skipping config/initializers/simple_showcase_admin.rb creation, as file already exists!"
      #   else
      #     puts "Adding simple_showcase_admin initializer (config/initializers/simple_showcase_admin.rb)..."
      #     template "initializer.rb", path
      #     require path # Load the configuration per issue #415
      #   end
      # end

      def run_migrations
        unless options["no-migrate"]
          puts "Running rake db:migrate"
          `rake db:migrate`
        end
      end

      def mount_engine
        puts "Mounting SimpleShowcaseAdmin::Engine at \"/admin\" in config/routes.rb..."
        insert_into_file("#{Rails.root}/config/routes.rb", :after => /routes.draw.do\n/) do
          %Q{
  mount SimpleShowcaseAdmin::Engine, :at => '/admin'
}
        end
      end

      def finished
        output = "\n\n" + ("*" * 53)
        output += %Q{\nDone! SimpleShowcaseAdmin has been successfully installed.

Here's what happened:\n\n}

        output += "SimpleShowcaseAdmin's migrations were copied over into db/migrate.\n"

        unless options["no-migrate"]
          output += "`rake db:migrate` was run, running all the migrations against your database.\n"
        end
        output += "The engine was mounted in your config/routes.rb file using this line:

   mount SimpleShowcaseAdmin::Engine, :at => \"/admin\""
      end

      private

      def next_migration_number
        last_migration = Dir[Rails.root + "db/migrate/*.rb"].sort.last.split("/").last
        current_migration_number = /^(\d+)_/.match(last_migration)[1]
        current_migration_number.to_i + 1
      end
    end
  end
end
