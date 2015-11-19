class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def create
    Market.create(market_params[:market])
    redirect_to '/markets'
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    market = Market.find(params[:id])
    market.update(market_params[:market])
    redirect_to '/markets'
  end

  def show
    @market = Market.find(params[:id])
    @vendors = @market.vendors
    if params[:type] == "user"
      @im_a_market = false
    else
      @im_a_market = true
    end
  end

private

  def market_params
    params.permit(market:[:name, :address, :city, :county, :state, :zip])
  end

end
