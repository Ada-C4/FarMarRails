class ProductsController < ApplicationController

	def find_vendor 
		@vendor = Vendor.find(params[:vendor_id])
	end

	def find_product
		@product = Product.find(params[:id])
	end

	def index
		find_vendor
		@products = Product.where(vendor_id: @vendor.id)
	end

	def new
  	@product = Product.new
  	find_vendor
  end

	def destroy
		@product = Product.destroy(params[:id])

		redirect_to vendor_products_path
	end

	def create
		Product.create(product_params[:product])
		redirect_to vendor_products_path
	end

  def edit
  	find_vendor
  	find_product
  end

  def update
  	find_vendor
  	find_product

  	@product.update(product_params[:product])
  	redirect_to vendor_products_path
  end

	private

	def product_params
		params.permit(product: [:name, :vendor_id])
	end
end
