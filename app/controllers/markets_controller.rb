class MarketsController < ApplicationController
  def home
    @markets = Market.all
  end

  def index
    @markets = Market.all
  end

  def new
    id = params[:id]
    @market = Market.find(id)
  end

  def show
  	@market = Market.find(params[:id])
  end

  def create
    Market.create(task_params[:market])
  end

  def edit
    id = params[:id]
    Market.delete(id)
    redirect_to "/"
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
  end

  private

  def market_params
    params.permit(market:[:name, :address, :city, :county, :state, :zip])
  end

end
