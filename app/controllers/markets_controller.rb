class MarketsController < ApplicationController
  def new
    @market = Market.new
  end

  def create
    Market.create(market_params[:market])
    redirect_to '/markets'
  end

private

  def market_params
    params.permit(market:[:name, :address, :city, :county, :state, :zip])
  end

end
