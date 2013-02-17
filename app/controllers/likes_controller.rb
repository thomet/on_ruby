class LikesController < ApplicationController
  before_filter :check_login, only: :create

  expose(:topic)
  expose(:like)

  def create
    like.topic = topic
    like.user  = current_user
    if topic.already_liked?(current_user)
      redirect_to(root_path, alert: t("flash.double_liked"))
    elsif like.save
      redirect_to(root_path, notice: t("flash.liked"))
    else
      redirect_to(root_path, alert: like.errors.full_messages.join(' '))
    end
  end
end
