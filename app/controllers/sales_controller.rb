class SalesController < ApplicationController
  def index
    @sales= Sale.all
  end

  def new
    @sale = Sale.new
    session[:return_to] = request.referrer
  end

  def create
    sale = Sale.create(sale_params)
    sale.vendor_id = sale.product.vendor.id
    sale.save
    redirect_to session[:return_to]
  end

  private

  def sale_params
    sale = params.require(:sale).permit(:amount)
    sale.merge(params.permit(:product_id)).merge(params.permit(:purchase_time))
  end
end
