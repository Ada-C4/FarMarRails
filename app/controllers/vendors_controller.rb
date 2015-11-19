class VendorsController < ApplicationController
  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
    @action = "create"
  end

  def create
    new_vendor = Vendor.create(vendor_params)
    redirect_to vendor_path(new_vendor)
  end

  def edit
    id = params[:id]
    @vendor = Vendor.find(id)
    @action = "update"
  end

  def update
    updated_vendor = Vendor.update(params[:id], vendor_params)
    redirect_to vendor_path(updated_vendor)
  end

####################
  private
  def vendor_params
    params.require(:vendor).permit(:name, :employees)
  end

end
