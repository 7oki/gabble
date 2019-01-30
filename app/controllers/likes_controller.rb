class LikesController < ApplicationController
  
  def create
    @like = Like.create(user_id: current_user.id, micropost_id: params[:micropost_id])
    @likes = Like.where(micropost_id: params[:micropost_id])
    flash[:success] = "お気に入り登録しました"
    redirect_back(fallback_location: root_path)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, micropost_id: params[:micropost_id])
    like.destroy
    @likes = Like.where(micropost_id: params[:micropost_id])
    flash[:success] = "お気に入りを削除しました"
    redirect_back(fallback_location: root_path)
  end
end