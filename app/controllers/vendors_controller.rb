class VendorsController < ApplicationController

  def edit
    id = params[:id]
    @vendor = Vendor.find(id)
  end

  def index
    vendors = Vendor.all
    @vendors = vendors.order(:name)
  end

  def show
    id = params[:id]
    @vendor = Vendor.find(id)
    @products = @vendor.products

    if request.path_info.include?('markets')
      render :market_vendor
    else
      render :show
    end
  end

  def update
    id = params[:id]
    @vendor = Vendor.find(id)
    @vendor.update(vendor_params[:vendor])
    redirect_to market_path(@vendor.market)
  end

  private

  def vendor_params
    params.permit(vendor:[:name, :num_employees, :market_id])
  end

end
