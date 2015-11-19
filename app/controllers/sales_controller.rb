class SalesController < ApplicationController
  def new
    @sale = Sale.new
    @action = "create"
  end

  def create
    Sale.create(sale_params) { |sale| sale.purchase_time = Time.now }

    vendor_id = params[:vendor_id]
    redirect_to vendor_path(vendor_id)
  end

  private

  def sale_params
    sale = params.require(:sale).permit(:amount)
    sale.merge(params.permit(:product_id))
  end
end
