class SalesController < ApplicationController
  def index
    @title = "Sales"
    @vendor_id = params[:vendor_id]
    @vendor = Vendor.find(@vendor_id)
    @product_names = []
    @monthly_product_names = []
    @total = 0
    @monthly_total = 0
    @sales = Sale.where(vendor_id: @vendor_id)
    @sales.each do |sale|
      @total += sale.amount
      product = sale.product.name
      @product_names.push(product)
    end
    @sales_month = Vendor.find(@vendor_id).monthly_sales
    @sales_month.each do |sale|
      @monthly_total += sale.amount
      product = sale.product.name
      @monthly_product_names.push(product)
    end
  end

  def new
    @title = "Sales Info"
    @vendor_id = params[:vendor_id]
    @vendor = Vendor.find(@vendor_id)
    @sale = Sale.new()
    @options = Product.where(vendor_id: @vendor_id)
    @action = "create"
  end

  def create
    @vendor_id = params[:vendor_id]

    new_params = sales_params[:sale]
    sale_amount = new_params[:amount]
    binding.pry
    sale_amount = sale_amount.to_f * 100
    new_params[:amount] = sale_amount
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
