class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
    @market = Market.find(params[:market_id])
  end

  def create
    vendor = Vendor.create(vendor_params) do |v|
      v.market = Market.find(params[:market_id])
    end
    redirect_to vendor.market
  end

  def edit
    @vendor = Vendor.find(params[:id])
    @market = Market.find(params[:market_id])
  end

  def update
    vendor = Vendor.find(params[:id])
    vendor.update(vendor_params)
    redirect_to vendor.market
  end

  def destroy
    vendor = Vendor.destroy(params[:id])
    redirect_to vendor.market
  end

  def show
    @vendor = Vendor.find(params[:id])
    @products = @vendor.products
  end

  private

  def vendor_params
    params.require(:vendor).permit([:name, :num_employees])
  end
end
