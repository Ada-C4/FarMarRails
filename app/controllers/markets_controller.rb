class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def create
    Market.create(market_params[:market])
    redirect_to "/markets"
  end

  def edit
    id = params[:id]
    @market = Market.find(id)
  end

  def show
    id = params[:id]
    @market = Market.find(id)
    @vendors = Market.find(id).vendors
  end

  def update
    id = params[:id]
    @market = Market.find(id)
    @market.update(
      name: market_params[:market][:name],
      address: market_params[:market][:address],
      city: market_params[:market][:city],
      county: market_params[:market][:county],
      state: market_params[:market][:state],
      zip: market_params[:market][:zip]
      )
    redirect_to "/markets"
  end

  def destroy
    id = params[:id]
    Market.destroy(id)
    redirect_to "/markets"
  end

  private

  def market_params
    params.permit(market:[:id, :name, :address, :city, :county, :state, :zip])
  end

end
