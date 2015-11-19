class MarketsController < ApplicationController
  def home
    @markets = Market.all
  end

  def index
  	fdsfds
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def show
  	@market = Market.find(params[:id])
		if URI(request.referrer).path == '/markets'
			@buttons = true
		else 
			@buttons = false
		end
  end

  def create
    Market.create(market_params[:market])
    redirect_to markets_path
  end

  def edit
    @market=Market.find(params[:id])
  end

  def destroy
    id = params[:id]
    Market.delete(id)
    redirect_to "/"
  end

  def update
    id = params[:id]
    market = Market.find(id)
    market.update(
    name: market_params[:market][:name],
    address: market_params[:market][:address],
    city: market_params[:market][:city],
    county: market_params[:market][:county],
    state: market_params[:market][:state],
    zip: market_params[:market][:zip],
    )
    redirect_to markets_path
  end

  private

  def market_params
    params.permit(market:[:name, :address, :city, :county, :state, :zip])
  end

end
