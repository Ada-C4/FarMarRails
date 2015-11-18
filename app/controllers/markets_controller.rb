class MarketsController < ApplicationController
  def home
  end
  def index
    @markets = Market.all
    @market_link = "Add new market!"
  end
  def show
    id = params[:id]
    @market = Market.find(id)
    @vendors = @market.vendors
    @delete_vendor = "DESTROY vendor is coming soon!"
    @create_vendor = "ADD a vendor is coming soon!"
    @edit_vendor =  "EDIT a vendor is coming soon!"
  end

  def user_view
    @markets = Market.all
    @market_link = ""
    render "index"
  end

  def user_show
    id = params[:id]
    @market = Market.find(id)
    @vendors = @market.vendors
    @delete_vendor = ""
    @create_vendor = ""
    @edit_vendor =  ""
    render "show"
  end

  def create
  end
  def new
  end
  def edit
  end
  def update
  end
end
