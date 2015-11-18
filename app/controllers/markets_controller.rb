class MarketsController < ApplicationController

  def home
    @markets = Market.all
  end

  def show
    id = params[:id]
    @market = Market.find(id)
    @vendors = @market.vendors
  end
end
