class SalesController < ApplicationController
  def index
    id = params[:vendor_id]
    @vendor = Vendor.find(id)
    @sales = @vendor.sales
  end
end
