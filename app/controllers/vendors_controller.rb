class VendorsController < ApplicationController
  def index
    id = params[:market_id]
    @market = Market.find(id)
  end
end
