module VersionCore
  class UpdateVersion < ApplicationRecord
    include VersionCore::Concerns::Models::UpdateVersion
    
    self.table_name = "update_versions"
  end
end