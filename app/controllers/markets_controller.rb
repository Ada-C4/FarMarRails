class MarketsController < ApplicationController
  def home
    @markets = Market.order(:name)
  end

  def index
  	user = params[:user_type]
  	session[:user_type] = user unless user.nil?
  	@buttons = true if session[:user_type] == 'market'
  	@markets = Market.all if params[:order].nil?
    @markets = Market.order(name: :desc) if params[:order] == 'za'
    @markets = Market.order(:name) if params[:order] == 'az'
  end

  def new
    @market = Market.new
  end

  def show
  	@market = Market.find(params[:id])
		@is_market = true if session[:user_type] == 'market'
		@is_vendor = true if session[:user_type] == 'vendor' 
		@is_guest = true if session[:user_type] == 'guest' || session[:user_type].nil?
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
