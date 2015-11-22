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
    Market.create(
    	name: market_params[:name].titleize,
    	address: market_params[:address].titleize,
    	city: market_params[:city].titleize,
    	county: market_params[:county].titleize,
    	state: market_params[:state].titleize,
    	zip: market_params[:zip],
    	)
    redirect_to markets_path
  end

  def edit
    @market=Market.find(params[:id])
  end

  def destroy
    Market.delete(params[:id])
    redirect_to "/"
  end

  def update
    market = Market.find(params[:id])
    market.update(
    name: market_params[:name].titleize,
    address: market_params[:address].titleize,
    city: market_params[:city].titleize,
    county: market_params[:county].titleize,
    state: market_params[:state].titleize,
    zip: market_params[:zip],
    )
    redirect_to markets_path
  end

  private

  def market_params
    market = params.require(:market).permit(:name, :address, :city, :county, :state, :zip)
  end

end
