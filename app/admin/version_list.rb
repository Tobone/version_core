ActiveAdmin.register VersionList do
  menu priority: 998, parent: "运营管理", label: "系统版本列表"
  permit_params :number, :is_show
  
  index do
    index_column
    column "系统版本号", :number
    column "是否展示在更新列表", :is_show
    actions
  end
end