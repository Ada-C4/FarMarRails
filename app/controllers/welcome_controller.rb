class WelcomeController < ApplicationController
  def index
    @markets = Market.all
    @vendors = Vendor.all
  end
end
