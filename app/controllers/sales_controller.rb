class SalesController < ApplicationController
  def index
    id = params[:vendor_id]
    @vendor = Vendor.find(id)
    @sales = @vendor.sales
    @total_sales = Vendor.total_sales(id).to_f / 100
  end

  def current_month
    id = params[:vendor_id]
    
  end
end
