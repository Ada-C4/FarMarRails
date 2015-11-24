class MarketsController < ApplicationController

  def sign_in
    @title = "Farmers Market Sign In"
  end

  def index
    @markets = Market.all
    @title = "Markets"
  end

  def show
    id = params[:id]
    @market = Market.find(id)
    @title = "Market Info"
  end

  def new
    @market = Market.new()
    @action = "create"
    @title = "Add a Market"
  end

  def create
    Market.create(market_params[:market])
    redirect_to "/markets"
  end

  def edit
    id = params[:id]
    @market = Market.find(id)
    @action = "update"
    @title = "Edit a Market"
  end

  def update
    id = params[:id]
    Market.update(id, market_params[:market])
    redirect_to "/markets/#{id}"
  end

  def destroy
    id = params[:id]
    Market.destroy(id)
    redirect_to markets_path
  end

  private

  def market_params
    params.permit(market:[:name, :address, :city, :county, :state, :zip])
  end
end
