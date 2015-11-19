class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create(name: product_params[:product][:name], vendor_id: params[:vendor_id])
    redirect_to vendor_path(params[:vendor_id])
  end

  def edit
    @product = Product.find(params[:id])
    name = params[:name]
  end

  def update
    @product = Product.find(params[:id])
    Product.update(params[:id], product_params[:product])
    redirect_to vendor_path(params[:vendor_id])
  end

  def destroy

  end

  private

  def product_params
    params.permit(product: [:name])
  end
end
