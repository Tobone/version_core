module VersionCore::Concerns
  module Models
    module UpdateVersion
      extend ActiveSupport::Concern

      included do
        store :channels,  accessors: [:ieltsBroServer, :yingyongbao, :ios,
                                      :baidu, :channel_360, :ali, :anzhi,
                                      :huawei, :xiaomi, :oppo, :vivo, :samsung,
                                      :meizu, :jinli, :youzan, :staff ], coder: JSON
        enum notify_type: { force: 1, suggest: 2 }
        enum os_type: { android: 1, ios: 2, all_os: 3 }
        
        validates *VersionCore::UpdateVersion.stored_attributes[:channels], url: true
        validates :onlined_at, :new_version, :notify_type, :content, presence: true
      end
    end 
  end
end
