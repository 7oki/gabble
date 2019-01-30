class MicropostsController < ApplicationController
  before_action :logged_in_user,    only: [:show, :create, :destroy]
  #before_action :correct_user,      only: :destroy     管理者の前投稿削除のためにコメントアウト
  
  #投稿詳細
  def show
    @microposts = Micropost.find_by(id: params[:id])
    @micropost = @microposts
    if @microposts.nil?
      redirect_to root_url
    else
      @likes = Like.where(micropost_id: params[:micropost_id])
      @comments = @microposts.comments
      @comment = Comment.new
    end
    
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "投稿に成功しました"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    unless current_user.admin?
      @micropost = current_user.microposts.find_by(id: params[:id])
    else
      @micropost = Micropost.find_by(id: params[:id])
    end
    
    @micropost.destroy
    flash[:success] = "投稿を削除しました"
    @shares = Share.where(micropost_id: params[:id])
    @shares.destroy_all
    @microposts = Micropost.where(shared_id: params[:id])
    @microposts.destroy_all
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end