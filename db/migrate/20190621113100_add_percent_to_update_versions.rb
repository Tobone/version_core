class AddPercentToUpdateVersions < ActiveRecord::Migration[5.2]
  def change
    add_column :update_versions, :percent, :string, comment: '更新的百分比 90~98的随机数'
  end
end