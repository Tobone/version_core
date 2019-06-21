class VersionCore::VersionsController < ApplicationController
  api :GET, '/versions', '获取首页指南下的文章列表'
  formats ['json']
  param :channel, String, desc: '渠道 值为:ieltsBroServer, :yingyongbao, :ios,
                                      :baidu, :channel_360, :ali, :anzhi,
                                      :huawei, :xiaomi, :oppo, :vivo, :samsung,
                                      :meizu, :jinli, :youzan, :staff', required: true
  param :os_type, String, desc: '系统类型 android/ios', required: true
  param :push_version, String, desc: 'app当前版本', required: true
  returns code: 200, desc: "正确结果参数类型" do
    property :notify_type, String, desc: "force 强制更新 suggest 提示更新"
    property :content, String, desc: "内容"
    property :channel_url, String, desc: "对应的下载app的路径"
  end
  example '
  请求参数含有: {
    "channel": "huawei",
    "os_type": "android", 
    "push_version": "1.0.0" 
  }
  返回正确结果: 需要更新{
    "code": 0,
    "message": "更新版本",
    "data": {
        "notify_type": "force",
        "content": "123",
        "channel_url": "http:://www.baidu.com"
    }
  }
  失败{
    "code": 422,
    "message": "输入的渠道不合法"
  }
  不需要更新{
    "data": null
  }'
  def check
    unless params[:channel] && VersionCore::UpdateVersion.stored_attributes[:channels].include?(params[:channel].to_sym)
      return render json: { code: 422, message: "输入的渠道不合法" }
    end
    version = VersionCore::UpdateVersion.where(os_type: [params[:os_type], "all_os"]).where(" ? = ANY(#{params[:os_type]}_versions)", params[:push_version]).where("onlined_at < ?", Time.now).order('created_at asc').last
    return render json: { code: 0, message: "更新版本", data: version.as_json(only: [:content, :notify_type, :percent]).merge(channel_url: version.send(params[:channel].to_sym))} if version.present?
    return render json: { data: nil }
  end
end