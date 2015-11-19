class VendorsController < ApplicationController

  def vendors
    @vendors = Vendor.all
    render :index
  end

  def show
    @is_a_vendor = true
    id = params[:id]
    # market_id = params[:market_id]
    @vendor = Vendor.find(id)
    @products = @vendor.products
  end

  def edit
    id = params[:id]
    @vendor = Vendor.find(id)
  end

  def update
    # id = params[:id]
    # vendor = Vendor.find(id)
      Vendor.update(params[:id], vendor_params[:vendor])
    redirect_to market_path(vendor_params[:vendor][:market_id])
  end

  private

  def vendor_params
    params.permit(vendor:[:name, :employees, :market_id])
  end

end
