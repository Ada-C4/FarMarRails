class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales
  end

  def new
    @sale = Sale.new
    @products = Vendor.find(params[:vendor_id]).products
  end

  def create
     s = Sale.create(sale_params)
     s.product_id = params[:product][:id]
     s.vendor_id = params[:sale][:vendor_id]
     s.save
     redirect_to vendor_path(s.vendor_id)
  end

  private

  def sale_params
    params.require(:sale).permit(:amount, :purchase_time, :product_id, :vendor_id)
  end

end
