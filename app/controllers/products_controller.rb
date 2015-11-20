class ProductsController < ApplicationController
  def index
    redirect_to vendor_path(params[:vendor_id])
  end

  def new
    @vendor_product = Product.new
    @url_path = vendor_products_path
  end

  def create
    Product.create(name: product_params[:product][:name], vendor_id: params[:vendor_id])
    redirect_to vendor_path(params[:vendor_id])
  end

  def edit
    id = params[:id]
    @vendor_product = Product.find(id)
    @url_path = vendor_product_path
  end

  def update
    id = params[:id]
    @vendor_product = Product.find(id)
    @vendor_product.update(product_params[:product])
    redirect_to vendor_path(params[:vendor_id])
  end

  def destroy
    id = params[:id]
    Product.destroy(id)
    redirect_to vendor_path(params[:vendor_id])
  end

  private

  def product_params
    params.permit(product:[:name])
  end

end
