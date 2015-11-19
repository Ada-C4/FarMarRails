class SalesController < ApplicationController
  def index
    id = params[:vendor_id]
    @vendor = Vendor.find(id)
    @sales = @vendor.sales.order(purchase_time: :desc)
    @total_sales = Vendor.total_sales(id).to_f / 100
  end

  def current_month
    id = params[:vendor_id]
    @vendor = Vendor.find(id)
    @current_month_sales = Sale.current_month_sales(id).order(purchase_time: :desc)
    @num_current_month_sales = Sale.num_current_month_sales(id)
  end
end
