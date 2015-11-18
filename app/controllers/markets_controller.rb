class MarketsController < ApplicationController

  def home
    @items = Market.all
  end
end
