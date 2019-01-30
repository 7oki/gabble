class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @feed_items = current_user.feed.paginate(page: params[:page])
      @micropost  = current_user.microposts.build
       # like拡張機能
      @likes = Like.where(micropost_id: params[:micropost_id])
      if params[:q]
        @feed_items = Micropost.search_by_keyword(params[:q])
                        .paginate(page: params[:page])
      else
        @feed_items = current_user.feed.paginate(page: params[:page])
      end
    else
      redirect_to login_path
    end
  end

  def show
  end
end
