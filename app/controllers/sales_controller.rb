class SalesController < ApplicationController
  def index
    @sales = Vendor.find(params[:vendor_id]).sales
    @vendor = Vendor.find(params[:vendor_id])
  end

  def current_month
    @sales = Vendor.find(params[:vendor_id]).sales
    @vendor = Vendor.find(params[:vendor_id])
  end

end
