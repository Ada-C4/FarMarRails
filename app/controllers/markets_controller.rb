class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def vendors
    @market = Market.find(params[:id])
  end

  def show
    @market = Market.find(params[:id])
  end

  def new
    @market = Market.new
    @action = "create"
  end

  def create
    new_market = Market.create(market_params[:market])

    redirect_to market_path(new_market)
  end

  def edit
    id = params[:id]
    @market = Market.find(id)
    @action = "update"

    render :new
  end

  def update
    updated_market = Market.update(params[:id], market_params[:market])

    redirect_to market_path(updated_market)
  end

  private

  def market_params
    params.permit(market:[:name, :address, :city, :county, :state, :zip])
  end

end
