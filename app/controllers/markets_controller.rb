class MarketsController < ApplicationController

  before_action :get_market, only: [:edit, :show, :update]

  def get_market
    @market = Market.find(params[:market_id] || params[:id])
  end

  def show
    get_market
  end

  def show_markets
    @markets = Market.all.order(:created_at).reverse_order
  end

  def destroy
    Market.destroy(params[:id])
    redirect_to show_markets_markets_path
  end

  def new
    @market = Market.new
    @title = "New Market"
  end

  def create
    Market.create(market_params[:market])
    redirect_to show_markets_markets_path
  end

  def edit
    get_market
    @title = "Edit task"
  end

  def update
    get_market
    @market.update(market_params[:market])
    redirect_to show_markets_markets_path
  end

  def get_vendor
  	get_market
  	@vendor = Vendor.find(params[:id])
  end

  def show_vendors
  	get_market
  	@vendors = Vendor.where(market_id: @market.id)
  end

  def new_vendor
  	get_market
  	@form_url = market_create_vendor_path(@market, @vendor)
  	@vendor = Vendor.new
  end

  def create_vendor
  	get_market
  	Vendor.create(vendor_params[:vendor])
  	redirect_to market_by_vendor_path(params[:market_id])
	end

	def edit_vendor
  	get_vendor
  	get_market
  	@form_url = market_update_vendor_path(@market, @vendor)
  	if !params[:market_id].nil?
      @market = Market.find(params[:market_id])
   	end
  end

  def update_vendor
  	get_vendor
  	get_market
    if params[:market_id].nil?
    	@vendor.update(vendor_params[:vendor])
    	redirect_to market_by_vendor_path
    else
      @vendor.update(vendor_params[:vendor])
      redirect_to market_by_vendor_path(params[:market_id])
    end
  end

  def delete_vendor
  	get_market
		@vendor = Vendor.destroy(params[:id])

		redirect_to market_by_vendor_path(params[:market_id])
	end

	def search
    if params[:search]
      @markets_search = Market.search(params[:search]).order("created_at DESC")
    else
      @markets_search = Market.order("created_at DESC")
    end
   end

  private

  def market_params
    params.permit(market:[:name, :address, :city, :county, :state, :zip])
  end

end
