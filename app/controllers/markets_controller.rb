class MarketsController < ApplicationController
  def home
    @markets = Market.all
  end

  def index
  	session[:user_type] = params[:user_type]
  	@buttons = true if session[:user_type] == 'market'
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def show
  	@market = Market.find(params[:id])
		@buttons = true if session[:user_type] == 'market'
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
