class AccountsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @account = Account.new()
  end
  
  def index
    @account_feed_items = current_user.account_feed.paginate(page: params[:page])
  end
  
  def create
    @account = current_user.accounts.build(accounts_params)
    if @account.save
      flash[:success] = "アカウント作成申請を行いました"
      redirect_to root_url
    else
      @account_feed_items = []
      render 'accounts/new'
    end
  end
  
  def show
  @accounts = Account.find_by(id: params[:id])
  end
  
  def reject
    flash[:success] = #"アカウント作成申請を拒否しました"
    redirect_to root_url
  end
  
  private
  
  def accounts_params
    params.require(:account).permit(:name,:picture,:reason,:treated)
  end
  
end
