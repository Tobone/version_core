module VersionCore
  class Engine < ::Rails::Engine
    isolate_namespace VersionCore
    puts File.expand_path("#{ENV['PWD']}/app/models/update_version.rb")
    if File.exist?(File.expand_path("#{ENV['PWD']}/app/models/update_version.rb")) && 
    File.exist?(File.expand_path("#{ENV['PWD']}/app/models/version_list.rb"))
      initializer "active_admin" do |app|
        ActiveAdmin.before_load do |app|
          app.load_paths << File.expand_path("../../../app/admin", __FILE__) 
        end
      end
    end
  end
end