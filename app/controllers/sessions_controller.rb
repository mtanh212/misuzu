class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by 担当者コード:params[:session][:担当者コード]
    if user && (user.authenticate params[:session][:password])
      flash[:notice] = t "app.flash.wellcome_to"
      log_in user
    else
      flash[:danger] = t "app.flash.login_field"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
