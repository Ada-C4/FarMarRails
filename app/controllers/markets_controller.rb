class MarketsController < ApplicationController
  def home
  end
  def index
    @markets = Market.all
    @market_link = true
    @url = ""
  end

  def show
    id = params[:id]
    @market = Market.find(id)
    @vendors = @market.vendors
    @buttons = true

    #@delete_vendor = "DESTROY vendor is coming soon!"
    #@create_vendor = "ADD a vendor is coming soon!"
    #@edit_vendor =  "EDIT a vendor is coming soon!"
  end

  def user_view
    @url = "/user_show"
    @markets = Market.all
    @market_link = false
    render "index"
  end

  def user_show
    id = params[:id]
    @market = Market.find(id)
    @vendors = @market.vendors
    @buttons = false
    render "show"
  end

  def create
    Market.create(market_params[:market])
    redirect_to markets_path
  end

  def new
    @market = Market.new
    @action = "create"
    @method = :post
    @title = "Market Information"
  end

  def edit
    @title = "Edit your market"
    id = params[:id]
    @action = "update"
    @method = :patch
    @market = Market.find(id)
    render "new"
  end

  def update
    Market.update(params[:id], market_params[:market])
    #redirect_to '/'
    redirect_to market_path(params[:id])
  end

  private

  def market_params
    #this makes strong params
    params.permit(market:[:name, :address, :city, :county, :state, :zip])
  end
end
