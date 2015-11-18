class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def show
    id = params[:id]
    @market = Market.find(id)
  end

end
