class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers, :messages]
  before_action :correct_user,   only: [:edit, :update, :likes]
  before_action :admin_user,     only: [:destroy, :new]
  
  def index
    @users = User.paginate(page: params[:page]).search(params[:search])
  end

  def show
    @user = User.find_by(id: params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
    # like拡張機能
    @likes = Like.where(micropost_id: params[:micropost_id])
    #メッセージ
    @room_id = message_room_id(current_user, @user)
    @messages = Message.recent_in_room(@room_id)
  end
  
  def new
      @user = User.new
  end

#専用アカウント作成  
  def new_designated
      @user = User.new(user_params)
      @user.name = "#{500000 + @user.name.to_i}" <<  [*'a'..'z'].shuffle[0]
      @user.password = [*'A'..'Z', *'a'..'z', *0..9].shuffle[0..7].join
  end

  def create
    @user = User.new(user_params)
    @user.login_name = @user.email.split("@")[0]
    @user.official = true
    if @user.save
      @user.active_relationships.create(followed_id: 1)     # アカウント作成成功時に、管理者アカウントをフォロー
      @user.passive_relationships.create(follower_id: 1)    # アカウント作成成功時に、管理者アカウントにフォローされる
      flash[:success] = "アカウント作成に成功しました"
      redirect_to @user
    else
      render 'new'
    end
  end
  #専用アカウント用
  def create_designated
    @user = User.new(user_params)
    @user.login_name = @user.name
    @user.official
    if @user.save
      @user.active_relationships.create(followed_id: 1)     # アカウント作成成功時に、管理者アカウントをフォロー
      @user.passive_relationships.create(follower_id: 1)    # アカウント作成成功時に、管理者アカウントにフォローされる
      flash[:success] = "専用アカウント作成に成功しました"
      #redirect_to @user
    else
      render 'new_designated'
    end
  end
  
  def edit
  end
  
  def update
    @user.login_name = @user.email.split("@")[0]
    if @user.update_attributes(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除"
    redirect_to users_url
  end
  
  def following
    @title = "フォロー"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "フォロワー"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id).paginate(page: params[:page]).order('created_at DESC')
  end
  
  def notification
    @notifications = Notification.where(user_id: current_user.id)
  end
 
  private

    def user_params
      params.require(:user).permit(:name, :email, :profile,
                                   :password, :password_confirmation)
    end
    
    # beforeフィルター
    
    # 正しいユーザーかどうか確認
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # 管理者かどうか確認
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
