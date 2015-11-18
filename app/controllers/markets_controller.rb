class MarketsController < ApplicationController
  def index
    # main page for markets (as a market)
  end

  def show
    if request.path_info.include?('home')
      render :home_market
    else
      render :show
    end
  end

end
