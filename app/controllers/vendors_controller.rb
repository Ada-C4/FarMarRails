class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
  end

  def create
    vendor = Vendor.create(vendor_params[:vendor])
    redirect_to market_path(vendor.market_id)
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    vendor = Vendor.find(params[:id])
    vendor.update(vendor_params[:vendor])
    redirect_to market_path(vendor.market_id)
  end

  def destroy
    vendor = Vendor.destroy(params[:id])
    redirect_to market_path(vendor.market_id)
  end

private

  def vendor_params
    params.permit(vendor:[:name, :num_employees, :market_id])
  end

end
