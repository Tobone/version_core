class VersionCore::VersionsController < ApplicationController

  def check
    unless params[:channel] && VersionCore::UpdateVersion.stored_attributes[:channels].include?(params[:channel].to_sym)
      return render json: { code: 422, message: "输入的渠道不合法" }
    end
    version = VersionCore::UpdateVersion.where(os_type: [params[:os_type], "all_os"]).where(" ? = ANY(#{params[:os_type]}_versions)", params[:push_version]).where("onlined_at < ?", Time.now).order('created_at asc').last
    return render json: { code: 0, message: "更新版本", data: version.as_json(only: [:content, :notify_type]).merge(channel_url: version.send(params[:channel].to_sym))} if version.present?
    return render json: { data: nil }
  end
end