class SalesController < ApplicationController

  def index
    @vendor = Vendor.find(params[:vendor_id])
  end

  def new
    @sale = Sale.new
    @vendor = Vendor.find(params[:vendor_id])
  end

  def create
    @sale = Sale.create(amount: sales_params[:sale][:amount], purchase_time: sales_params[:sale][:purchase_time], product_id: params[:product_id], vendor_id: params[:vendor_id])
    redirect_to vendor_path(params[:vendor_id])
  end

  private

  def sales_params
    params.permit(sale: [:amount, :purchase_time, :product_id, :vendor_id])
  end
end
