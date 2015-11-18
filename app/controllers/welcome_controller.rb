class WelcomeController < ApplicationController
  def index
    @markets = Market.all
  end

  def show
    @market = Markets.all
  end
end
