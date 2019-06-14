class CreateUpdateVersions < ActiveRecord::Migration[5.2]
  def change
    create_table :update_versions do |t|
      t.datetime :onlined_at, comment: "生效时间"
      t.string :new_version, comment: "新版本"
      t.text :android_versions, array: true, default: [], comment: "android 更新的版本"
      t.text :ios_versions, array: true, default: [], comment: "ios 更新的版本"
      t.integer :notify_type, comment: "提示类型"
      t.text :content, comment: "更新展示文案"
      t.jsonb :channels, comment: "发布渠道"
      t.integer :os_type, comment: "两个系统 android系统 ios系统"

      t.timestamps
    end
  end
end
