class MarketsController < ApplicationController

  def home
    @markets = Market.all
  end
end
