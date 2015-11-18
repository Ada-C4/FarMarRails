class HomeController < ApplicationController
  
  def index
    markets = Market.all
    @markets = markets.order(:name)
  end
end
