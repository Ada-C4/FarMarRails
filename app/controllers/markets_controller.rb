class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def vendors
    @market = Market.find(params[:id])
  end

end
