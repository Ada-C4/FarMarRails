class SalesController < ApplicationController
  def index
    @vendor_id = params[:vendor_id]
    @product_names = []
    @total = 0
    @sales = Sale.where(vendor_id: @vendor_id)
    @sales.each do |sale|
      @total += sale.amount
      product = sale.product
      @product_names.push(product)
    end
  end

  def new
    @vendor_id = params[:vendor_id]
    @vendor = Vendor.find(@vendor_id)
    @sale = Sale.new()
    @options = Product.where(vendor_id: @vendor_id)
    @action = "create"
  end

  def create
    @vendor_id = params[:vendor_id]
    new_params = sales_params[:sale]
    new_params[:vendor_id] = @vendor_id
    new_params[:purchase_time] = Time.now
    Sale.create(new_params)
    redirect_to "/vendors/#{@vendor_id}/sales"
  end

  private

  def sales_params
    params.permit(sale:[:amount, :purchase_time, :vendor_id, :product_id])
  end
end
