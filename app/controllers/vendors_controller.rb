class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
  end

  def create
    Vendor.create(vendor_params[:vendor])
    redirect_to '/vendors'
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    vendor = Vendor.find(params[:id])
    vendor.update(market_params[:vendor])
    redirect_to '/vendors'
  end

  def destroy
    Vendor.destroy(params[:id])
    redirect_to '/vendors'
  end

private

  def vendor_params
    params.permit(vendor:[:name, :num_employees, :market_id])
  end

end
