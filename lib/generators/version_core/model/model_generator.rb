# frozen_string_literal: true

module VersionCore
  module Generators
    class ModelGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def generate_model
        copy_file "update_version.rb", "app/models/update_version.rb"
        copy_file "version_list.rb", "app/models/version_list.rb"
      end
    end
  end
end