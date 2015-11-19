class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def edit
    id = params[:id]
    @product = Product.find(id)
    @title = "Edit Product"
    @action = :update
  end

  def update
    id = params[:id]
    product = Product.find(id)
    vendor_id = product.vendor_id
    Product.update(params[:id], product_params[:product])
    redirect_to vendor_path(vendor_id)
  end

  def create
    Product.create(product_params[:product])
    redirect_to vendor_path(params[:vendor_id])
  end

  private

  def product_params
    params.permit(product:[:id, :name, :vendor_id])
  end


end
