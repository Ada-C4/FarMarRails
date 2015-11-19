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

end
