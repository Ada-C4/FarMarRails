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

  end

  def edit

  end

end
