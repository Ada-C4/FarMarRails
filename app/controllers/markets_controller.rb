class MarketsController < ApplicationController

  def sign_in

  end

  def index
    @markets = Market.all
  end
end
