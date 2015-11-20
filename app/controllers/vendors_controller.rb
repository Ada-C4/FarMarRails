class VendorsController < ApplicationController

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.create(vendor_params)
    redirect_to mkt_home_path(@vendor.market_id)
  end

  def select
    redirect_to vendor_path(params[:vendor][:id])
  end

  def index

  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def destroy
    v = Vendor.find(params[:id])
    mkt_id = v.market_id
    v.destroy
    redirect_to mkt_home_path(mkt_id)
  end

  private

  def vendor_params
    params.require(:vendor).permit(:name, :no_of_employees, :market_id)
  end
end
