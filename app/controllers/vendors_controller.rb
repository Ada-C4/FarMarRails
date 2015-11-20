class VendorsController < ApplicationController

  def vendors
    @vendors = Vendor.all
    render :index
  end

  def new
    @new_vendor = Vendor.new
  end

  def create
    a = Vendor.create( vendor_params[:vendor])
    redirect_to vendor_path(a.id)
  end

  def show
    @is_a_vendor = true
    id = params[:id]
    @vendor = Vendor.find(id)
    @products = @vendor.products
  end

  def edit
    id = params[:id]
    @vendor = Vendor.find(id)
  end

  def update
    Vendor.update(params[:id], vendor_params[:vendor])
    redirect_to market_path(vendor_params[:vendor][:market_id])
  end

  def destroy
    Vendor.destroy(params[:id])
    redirect_to market_path(params[:market_id])
  end


  private

  def vendor_params
    params.permit(vendor:[:name, :employees, :market_id])
  end

end
