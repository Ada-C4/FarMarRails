class SalesController < ApplicationController

  def index
    @sales = Sale.where("vendor_id = ?", params[:id]) #id is vendor_id
  end

  def new
    @sale = Sale.new
    @url_path = sales_create_vendor_product_path
  end

  # def create
  #   Sale.create(sale_params[:sale])
  #   vendor_id = params[:vendor_id]
  #   redirect_to "/vendors/#{vendor_id}/sales"
  #   @url_path = sales_create_vendor_product_path
  # end

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
    @url_path = sales_month_vendor_path
    start_date = DateTime.parse('2015-01-01 00:00:00')
    end_date = DateTime.parse('2015-02-01 00:00:00')
    @sales = Sale.where("vendor_id = ? AND purchase_time > ? AND purchase_time < ?", params[:id], start_date, end_date) #id is vendor_id
  end

  private

  def sale_params
    params.permit(sale:[:amount, :purchase_time, :vendor_id, :product_id])
  end

end
