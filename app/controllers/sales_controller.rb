class SalesController < ApplicationController

  def new
    @sale = Sale.new
  end

  def create
    a = Sale.create(
    :amount => ((sale_params[:sale][:amount]).to_i * 100),
    :purchase_time => sale_params[:sale][:purchase_time],
    :vendor_id => sale_params[:sale][:vendor_id],
    :product_id => sale_params[:sale][:product_id],

    )
    redirect_to vendor_product_path(a.vendor_id, a.product_id)
  end

  private

  def sale_params
    params.permit(sale:[:amount, :purchase_time, :vendor_id, :product_id])
  end


end
