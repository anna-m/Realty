class OffersController < ApplicationController

  before_filter :login_required
  before_filter :admin_required, :except => [ :index, :show ]

  def index
    @offers = Offer.all
  end
  def show
    unless @current_user.privileged?
      if @current_user.counter > 0
        @current_user.update_attribute :counter, @current_user.counter - 1
      else
        redirect_to offers_url, :alert => t(:expired)
      end
    end
    @offer = Offer.find params[:id]
  end
  def new
    @offer = Offer.new
  end
  def create
    @offer = Offer.new params[:offer]
    if @offer.save
      redirect_to offers_url, :notice => t(:create_offer)
    else
      render :action => :new
    end
  end
  def edit
    @offer = Offer.find params[:id]
    render :action => :new
  end
  def update
    @offer = Offer.find params[:id]
    if @offer.update_attributes params[:offer]
      redirect_to offers_url, :notice => t(:update_offer)
    else
      render :action => :new
    end
  end
  def destroy
    Offer.destroy params[:id]
    redirect_to offers_url, :notice => t(:destroy_offer)
  end
end
