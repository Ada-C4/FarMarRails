class MarketsController < ApplicationController
  def edit
    id = params[:id]
    @market = Market.find(id)
  end

  def index
    @markets = Market.all
  end

  def show
    id = params[:id]
    @market = Market.find(id)
    @vendors = @market.vendors.order(:name)
    if request.path_info.include?('home')
      render :home_market
    else
      render :show
    end
  end

  def update
    id = params[:id]
    @market = Market.find(id)
    @market.update(market_params[:market])
    redirect_to action: :index
  end

  private

  def market_params
    params.permit(market:[:name, :address, :city, :county, :state, :zip])
  end

end
