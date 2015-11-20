class MarketsController < ApplicationController

  def home

  end

  def index
    user = params[:user_type]
    session[:user_type] = user unless user.nil?
    @markets = Market.all

  end

  def show
    @market = Market.find(params[:id])
    @is_market = true if session[:user_type] == "market"
    @is_vendor = true if session[:user_type] == "vendor"
    @if_guest = true if session[:user_type] == "guest"
  end

  def new
    @market = Market.new
  end

  def create
    market = Market.create(market_params[:market])
    redirect_to "/markets/#{market.id}"
  end

  def edit
    @market = Market.find(params[:id])
    name = params[:name]
    address = params[:address]
    city = params[:city]
    county = params[:county]
    state = params[:state]
    zip = params[:zip]
  end

  def update
    @market = Market.find(params[:id])
    Market.update(params[:id], market_params[:market])
    redirect_to "/markets/#{@market.id}"
  end

  def destroy
    Market.destroy(params[:id])
    redirect_to "/markets/"
  end

  private

  def market_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

end
