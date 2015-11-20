class VendorsController < ApplicationController

  def index
    if !params[:market_id].nil?
      @market = Market.find(params[:market_id])
      @vendors = @market.vendors
      render :show_vendor
    end
  end

  def find_vendor
  	@vendor = Vendor.find(params[:id])
  end

  def new
  	@vendor = Vendor.new
  end

  def show_vendors
  	@vendors = Vendor.all.order(:created_at).reverse_order
  end

  def show
  	find_vendor
  end

  def destroy
		@vendor = Vendor.destroy(params[:id])

		redirect_to show_vendors_vendors_path
	end


	def create
  		Vendor.create(vendor_params[:vendor])
  		redirect_to show_vendors_vendors_path
	end

  def edit
  	find_vendor
    @market = Market.find(params[:market_id])
  end

  def update
  	find_vendor
    if params[:market_id].nil?
    	@vendor.update(vendor_params[:vendor])
    	redirect_to show_vendors_vendors_path
    else
      @vendor.update(vendor_params[:vendor])
      redirect_to market_vendors_path(params[:market_id])
    end
  end


  private

	def vendor_params
		params.permit(vendor:[:name, :no_employees, :market_id])
	end
end
