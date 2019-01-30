class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(login_name: params[:session][:login_name])
    if user && user.authenticate(params[:session][:password])
      if !current_user && user.official
        flash.now[:danger] = '生徒アカウントにログインしてください'
        render 'new'
      else
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      end
    else
      flash.now[:danger] = 'login_nameとpasswordの組み合わせが一致しません'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end