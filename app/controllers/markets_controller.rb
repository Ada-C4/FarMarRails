class MarketsController < ApplicationController
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
end
