class UsersController < ApplicationController

  before_filter :login_required, :only => [ :edit, :update ]

  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user].slice( :email, :password, :name, :card )
    if @user.save
      session[:user_id] = @user.id
      redirect_to offers_url, :notice => t(:signup)
    else
      render :action => :new
    end
  end

  def edit
    @user = @current_user
    render :action => :new
  end

  def update
    @user = @current_user
    if @user.update_attributes params[:user].slice( :email, :password, :name, :card )
      redirect_to offers_url, :notice => t(:profile_updated)
    else
      render :action => :new
    end
  end

end
