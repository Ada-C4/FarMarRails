class VendorsController < ApplicationController

  def vendors
    @vendors = Vendor.all
    render :index
  end

  def show
    id = params[:id]
    # market_id = params[:market_id]
    @vendor = Vendor.find(id)
    @products = @vendor.products
  end

end
