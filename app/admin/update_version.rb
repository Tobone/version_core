ActiveAdmin.register UpdateVersion do
  menu priority: 999, label: "版本更新管理", parent: "运营管理"

  permit_params :onlined_at, :percent, :new_version, :notify_type, :os_type,
                :content, *UpdateVersion.stored_attributes[:channels],
                android_versions: [], ios_versions: []

  form partial: "update_version"

  index do
    column "序号", :id
    column "生效时间", :onlined_at
    column "新APP版本号", :new_version
    column "系统类型" do |row| 
      case row.os_type
      when "android"
        "安卓"
      when "ios"
        "苹果"
      when "all_os"
        "所有系统"
      end
    end
    column "更新说明", :content
    column "安卓提示更新版本号" do |version|
      version.android_versions.join(",")
    end
    column "苹果提示更新版本号" do |version|
      version.ios_versions.join(",")
    end
    column "更新类型", :notify_type
    actions
  end

end
