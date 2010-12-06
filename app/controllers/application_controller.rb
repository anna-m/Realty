class ApplicationController < ActionController::Base

  protect_from_forgery

  before_filter :current_user, :counters

  private

  def current_user
    @current_user = User.find session[:user_id] rescue nil
  end

  def counters
    @offers_count = Offer.count
    @users_count = User.count
  end

  def login_required
    redirect_to root_url and return false if @current_user.blank?
  end

  def admin_required
    redirect_to root_url and return false unless @current_user.admin?
  end

end
