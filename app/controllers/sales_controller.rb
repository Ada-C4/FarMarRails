class SalesController < ApplicationController
  def index
    @sales = Vendor.find(params[:vendor_id]).sales
    @vendor = Vendor.find(params[:vendor_id])
  end

  def current_month
    @sales = Vendor.find(params[:vendor_id]).sales
    @vendor = Vendor.find(params[:vendor_id])
  end

  def new
    @sale = Sale.new
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:product_id])
  end

  def create
    params[:sale][:amount] = params[:sale][:amount].to_f * 100
    sale = Sale.create(sale_params) do |s|
      s.vendor = Vendor.find(params[:vendor_id])
      s.purchase_time = Time.now
      s.product = Product.find(params[:product_id])
    end
    redirect_to sale.vendor
  end

  private

  def sale_params
    params.require(:sale).permit(:amount)
  end

end
