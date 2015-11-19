class SalesController < ApplicationController
  def new
    @sale = Sale.new
    @action = "create"
    @method = :post
    @title = "Sale Information"
  end

  def create
    Sale.create(sale_params[:sale])
    redirect_to '/'
  end

private
  def sale_params
    params.require(:sale).permit(:amount, :purchase_time, :vendor_id, :product_id)
  end
end
