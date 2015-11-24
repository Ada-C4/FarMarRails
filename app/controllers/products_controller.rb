class ProductsController < ApplicationController
  def index
    vendor_id = params[:vendor_id]
    @products = Vendor.find(vendor_id).products
  end

  def new
    @product = Product.new
    @url_path = vendor_products_path
  end

  def create
    vendor_id = params[:vendor_id]
    Product.create(
      name: product_params[:product][:name],
      vendor_id: session[:vendor_id])
    redirect_to "/vendors/#{vendor_id}/products"
  end

  def edit
    id = params[:id]
    @product = Product.find(id)
    @url_path = vendor_product_path
  end

  def show
    id = params[:id]
    @product = Product.find(id)
  end

  def update
    id = params[:id]
    vendor_id = params[:vendor_id]
    @product = Product.find(id)
    @product.update(
      name: product_params[:product][:name],
      vendor_id: product_params[:product][:vendor_id]
      )
    redirect_to "/vendors/#{vendor_id}/products/#{id}"
  end

  def destroy
    @id = params[:id]
    @vendor_id = params[:vendor_id]
    Product.destroy(@id)
    redirect_to "/vendors/#{@vendor_id}/products"
  end

  private

  def product_params
    params.permit(product:[:name])
  end

end
