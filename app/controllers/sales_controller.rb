class SalesController < ApplicationController

  def index
    @sales = Sale.where("vendor_id = ?", params[:id]) #id is vendor_id
  end

  def new
    @sale = Sale.new
    @url_path = sales_create_vendor_product_path
  end

  def create
    num_pennies = sale_params[:sale][:amount].to_f * 100
    Sale.create(
    amount: num_pennies,
    purchase_time: Time.now,
    vendor_id: params[:vendor_id],
    product_id: params[:id]
    )
    redirect_to sales_vendor_path(session[:vendor_id])
  end

  def month
    month_id = params[:id]
    @sales = Sale.where("vendor_id = ?", session[:vendor_id]).select{ |sale| sale.purchase_time.month == month_id.to_i }
    render :index
  end

  def destroy
    
  end

  private

  def sale_params
    params.permit(sale:[:amount, :purchase_time, :vendor_id, :product_id])
  end

  def month_params
    params.permit(params[:id])
  end

end
