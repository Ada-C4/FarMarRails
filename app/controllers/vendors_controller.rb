class VendorsController < ApplicationController
  def v_home

  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.create(vendor_params)
    redirect_to mkt_home_path
  end

  def index

  end

  def show

  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :no_of_employees)
  end
end
