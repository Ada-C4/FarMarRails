class MarketsController < ApplicationController
  def home
    @market = Market.new
    @vendor = Vendor.new
  end

  def mkt_home
    @market = Market.find(params[:market][:id])
  end

  def index
    @markets= Market.all
  end

  def show
    @market = Market.find(params[:market][:id])
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.create(market_params)
    redirect_to root_path
  end

  private

  def market_params
    params.require(:market).permit(:name, :address, :city, :country, :state, :zip)
  end
end
