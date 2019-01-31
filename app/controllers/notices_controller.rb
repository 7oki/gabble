class NoticesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  
  def new
    @notice = Notice.new()
  end
  
  def index
    @notice_feed_items = current_user.notice_feed.paginate(page: params[:page])
  end
  
  def create
    @notice = current_user.notices.build(notices_params)
    if @notice.save
      flash[:success] = "全体通知申請を行いました"
      redirect_to root_url
    else
      @notice_feed_items = []
      render 'notices/new'
    end
  end
  
  def show
    @notice = Notice.find_by(id: params[:id])
  end
  
  def reject
    @notice.update_attributes(notices_params)
    flash[:success] = "全体通知申請を拒否しました"
    redirect_to root_url
  end
  private
  
  def notices_params
    params.require(:notice).permit(:content,:picture,:reason,:treated)
  end
  
end
