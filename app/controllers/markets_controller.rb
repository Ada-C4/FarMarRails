class MarketsController < ApplicationController

  before_action only:[:show, :edit] do
    @market = Market.find(params[:id])
  end

  def index
    @markets = Market.all
  end

  def new
    @market = Market.new
    @action = "create"
  end

  def create
    new_market = Market.create(market_params)

    redirect_to market_path(new_market)
  end

  def edit
    @action = "update"
    render :new
  end

  def update
    updated_market = Market.update(params[:id], market_params)
    redirect_to market_path(updated_market)
  end

###################################
  private

  def market_params
    params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
  end

end
