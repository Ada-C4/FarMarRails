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
    @url_path = sales_month_vendor_path
    start_date = DateTime.parse(name: sale_params[:sale][:month])
    end_date = DateTime.parse('2015-01-01 00:00:00')
    @sales = Sale.where("vendor_id = ? AND purchase_time > ? AND purchase_time < ?", params[:id], start_date, end_date) #id is vendor_id
  end

  private

  def sale_params
    params.permit(sale:[:amount, :purchase_time, :vendor_id, :product_id])
  end

end
