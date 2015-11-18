class MarketsController < ApplicationController
  def home
    @market = Market.new
    @vendor = Vendor.new
  end

  def index

  end

  def show

  end

end
