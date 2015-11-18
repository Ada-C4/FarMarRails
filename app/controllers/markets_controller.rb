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
end
