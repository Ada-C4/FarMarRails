class SalesController < ApplicationController
  def index
    @sales= Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    sale = Sale.create(sale_params[:sale])
    redirect_to market_vendor_product_sale(market_id: sale.vendor.market_id, product_id: sale.product_id, vendor_id: sale.vendor.id, sale_id: sale.id,)
  end

  def edit
    @sale = Sale.find(params[:id])
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def destroy
    id = params[:id]
    Sale.delete(id)
    redirect_to "/"
  end

  def update
    id = params[:id]
    sale = Sale.find(id)
    sale.update(
    amount: sale_params[:sale][:amount],
    purchase_time: sale_params[:sale][:purchase_time],
    )
    redirect_to market_vendor_product_sale(market_id: sale.vendor.market_id, product_id: sale.product_id, vendor_id: sale.vendor.id, sale_id: sale.id,)
  end

  private

  def sale_params
    params.permit(sales:[:amount, :purchase_time, :vendor_id, :product_id])
  end
end
