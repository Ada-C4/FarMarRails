class SalesController < ApplicationController

  def index
  end

  def new
    @sale = Sale.new
    @url_path = sales_create_vendor_product_path
  end

  def create
    Sale.create(
    amount: sale_params[:amount],
    purchase_time: Time.now,
    vendor_id: sale_params[:vendor_id],
    product_id: sale_params[:id]
    )
    redirect_to sales_vendor_path(session[:vendor_id])
  end

  def month
  end

  private

  def sale_params
    params.permit(product:[:amount, :vendor_id, :id])
  end

end
