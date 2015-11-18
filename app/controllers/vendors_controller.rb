class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    Vendor.create(vendor_params[:vendor])
    redirect_to "/vendors"
  end

  def edit
    id = params[:id]
    @vendor = Vendor.find(id)
  end

  def show
    id = params[:id]
    @vendor = Vendor.find(id)
    @products = Vendor.find(id).products
    @sales = Vendor.find(id).sales
  end

  def update
    id = params[:id]
    @vendor = Vendor.find(id)
    @vendor.update(
      name: vendor_params[:vendor][:name],
      no_employees: vendor_params[:vendor][:no_employees],
      market_id: vendor_params[:vendor][:market_id]
      )
    redirect_to "/vendors"
  end

  def destroy
    id = params[:id]
    Vendor.destroy(id)
    redirect_to "/vendors"
  end

  private

  def vendor_params
    params.permit(vendor:[:id, :name, :no_employees, :market_id])
  end

end
