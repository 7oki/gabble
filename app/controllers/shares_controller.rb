class SharesController < ApplicationController
  
  def create
    @share = Share.create(user_id: current_user.id, micropost_id: params[:micropost_id])
    if !@share.id.nil?
      @micropost = Micropost.create(content: "RT", user_id: current_user.id, shared_id: params[:micropost_id])
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @micropost = Micropost.find_by(user_id: current_user.id, shared_id: params[:micropost_id])
    @share = Share.find_by(user_id: current_user.id, micropost_id: params[:micropost_id])
    @share.destroy
    @micropost.destroy
    redirect_back(fallback_location: root_path)
  end
end
