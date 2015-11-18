class VendorsController < ApplicationController

  def markets
    @markets = Market.all
    render :index
  end
end
