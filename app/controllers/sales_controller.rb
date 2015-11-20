class SalesController < ApplicationController
  before_action :get_vendor, only: [:index, :current_month, :new]

  def get_vendor
    @vendor = Vendor.find(params[:vendor_id])
  end

  def index
    @sales = @vendor.sales.order(purchase_time: :desc)
    @total_sales = Vendor.total_sales(@vendor.id).to_f / 100
  end

  def current_month
    @current_month_sales = Sale.current_month_sales(@vendor.id).order(purchase_time: :desc)
    @current_month_revenue = Sale.current_month_revenue(@vendor.id).to_f / 100
  end

  def new
    @new_vendor_sale = Sale.new
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
