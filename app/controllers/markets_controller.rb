class MarketsController < ApplicationController

  def home
    @markets = Market.all
  end

  def show
    id = params[:id]
    @market = Market.find(id)
    @vendors = @market.vendors
  end

  def index
    @is_a_market = true
    @markets = Market.all
  end

  def edit
    id = params[:id]
    @market= Market.find(id)
    @title = "Edit Market"
    @action = :update
  end
end
