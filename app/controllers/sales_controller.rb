class SalesController < ApplicationController
  def index
    id = params[:vendor_id]
    @vendor = Vendor.find(id)
    @sales = @vendor.sales
    @total_sales = Vendor.total_sales(id).to_f / 100
  end

  def current_month
    id = params[:vendor_id]
    @current_month_sales = Sale.current_month_sales(id)
    @num_current_month_sales = Sale.num_current_month_sales(id)
  end
end
