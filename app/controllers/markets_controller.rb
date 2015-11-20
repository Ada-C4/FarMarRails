class MarketsController < ApplicationController

  def sign_in

  end

  def index
    @markets = Market.all
  end

  def show
    id = params[:id]
    @market = Market.find(id)
  end

  def new
    @market = Market.new()
    @action = "create"
  end

  def create
    Market.create(market_params[:market])
    redirect_to "/markets"
  end

  def edit
    id = params[:id]
    @market = Market.find(id)
    @action = "update"
  end

  def update
    id = params[:id]
    Market.update(id, market_params[:market])
    redirect_to "/markets/#{id}"
  end

  private

  def market_params
    params.permit(market:[:name, :address, :city, :county, :state, :zip])
  end
end
