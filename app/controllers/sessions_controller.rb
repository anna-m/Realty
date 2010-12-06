class SessionsController < ApplicationController

  def create
    user = User.find_by_email_and_password params[:email], params[:password]
    if user.present?
      session[:user_id] = user.id
      redirect_to offers_url, :notice => t(:login)
    else
      redirect_to :back, :alert => t(:login_fail)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => t(:logout)
  end

end
