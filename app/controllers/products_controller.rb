class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(name: product_params[:product][:name], vendor_id: params[:vendor_id])
    redirect_to "/vendors/#{product.vendor_id}"
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def product_params
    params.permit(product: [:name])
  end
end
