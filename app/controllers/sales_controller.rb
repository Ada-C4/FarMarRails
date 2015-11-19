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

  def new
    @new_vendor_sale = Sale.new
    @vendor = Vendor.find(params[:vendor_id])
  end

  def create
    Sale.create(
      product_id: sale_params[:sale][:product_id],
      amount: sale_params[:sale][:amount].to_i * 100,
      vendor_id: params[:vendor_id],
      purchase_time: Time.now)
    redirect_to vendor_sales_path(params[:vendor_id])
  end

  private

  def sale_params
    params.permit(sale:[:product_id, :amount])
  end

end
