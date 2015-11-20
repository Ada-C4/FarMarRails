class SalesController < ApplicationController
	def find_vendor 
		@vendor = Vendor.find(params[:id])
	end

  def find_product
  	@product = Product.find(params[:product_id])
  end

  def find_sale
  	@sale = Sale.find(params[:id])
  end

  def index
  	find_vendor
  	@sales = Sale.where(vendor_id: @vendor.id).order(:amount)
  end

	def new
		@vendor = Vendor.find(params[:vendor_id])
		find_product
  	@sale = Sale.new
  end

  def create
  	sale = Sale.create(sale_params[:sale])
  	amount = sale.amount*100
  	sale.update(:amount => amount)

		redirect_to vendor_products_path

  end

  private

  def sale_params
		params.permit(sale:[:amount, :purchase_time, :vendor_id, :product_id])
	end
end
