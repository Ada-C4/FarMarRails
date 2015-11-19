class MarketsController < ApplicationController
  def home

  end

  def mkt_home
    @market = Market.find(params[:id])
  end

  def index
    @markets= Market.all
  end

  def show
    @market = Market.find(params[:id])
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.create(market_params)
    redirect_to root_path
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])
    @market.update_attributes(market_params)
    render :mkt_home
  end

  private

  def market_params
    params.require(:market).permit(:name, :address, :city, :country, :state, :zip)
  end
end
