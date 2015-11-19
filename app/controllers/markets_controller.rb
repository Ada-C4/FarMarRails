class MarketsController < ApplicationController
  def home
    @market = Market.new
    @vendor = Vendor.new
  end

  def mkt_home

  end

  def index
    @markets= Market.all
  end

  def show

  end

end
