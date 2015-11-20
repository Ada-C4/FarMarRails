class MarketsController < ApplicationController
  before_action :get_market, only: [:edit, :show, :update]

  def get_market
    @market = Market.find(params[:id])
  end

  def create
    Market.create(market_params[:market])
    redirect_to action: :index
  end

  def edit

  end

  def index
    markets = Market.all
    @markets = markets.order(:name)
  end

  def new
    @market = Market.new
  end

  def show
    @vendors = @market.vendors.order(:name)
    if request.path_info.include?('home')
      render :home_market
    else
      render :show
    end
  end

  def update
    @market.update(market_params[:market])
    redirect_to action: :index
  end

  private

  def market_params
    params.permit(market:[:name, :address, :city, :county, :state, :zip])
  end

end
