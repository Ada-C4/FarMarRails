class SalesController < ApplicationController

  def new
    @sale = Sale.new
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:product_id])
  end

  def create
    id = params[:product_id]
    product = Product.find(id)
    product.sales.create(
    #Sale.create(
      product_id: sale_params[:sale][:product_id],
      amount: sale_params[:sale][:amount].to_f * 100,
      vendor_id: params[:vendor_id],
      purchase_time: Time.now)
      redirect_to vendor_path(params[:vendor_id])
  end

private
  def sale_params
    params.permit(sale:[:product_id, :amount])
  end
end
