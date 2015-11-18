class HomeController < ApplicationController
  def index
    @markets = Market.all
  end
end
