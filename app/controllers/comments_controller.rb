class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "コメントを投稿しました"
      micropost = Micropost.find_by(id: params[:comment][:micropost_id])
      Notification.create(user_id: micropost.user_id, from_id: micropost.id, type: 1)
    else
      flash[:danger] = "コメントの投稿に失敗しました"
    end
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @comment = Comment.find_by(uesr_id: current_user.id, micropost_id: params[:micropost_id])
    @comment.destroy
    flash[:success] = "コメントを削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :micropost_id)
  end
end
