class SalesController < ApplicationController
  def index
    @sales= Sale.all
  end

  def new
    id = params[:id]
    @sales= Sale.find(id)
  end

  def create
    Sale.create(sale_params[:sale])
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
    vendor_id: sale_params[:sale][:vendor_id],
    product_id: sale_params[:sale][:product_id],
    )
  end

  private

  def sale_params
    params.permit(sales:[:amount, :purchase_time, :vendor_id, :product_id])
  end
end
