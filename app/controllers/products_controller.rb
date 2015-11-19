class ProductsController < ApplicationController


  def edit
    id = params[:id]
    @product = Product.find(id)
    @title = "Edit Product"
    @action = :update
  end

  def update
    id = params[:product][:vendor_id]
    Product.update(params[:id], product_params[:product])
    redirect_to vendor_path(id)
  end

  def create
    @product = Product.create
    redirect_to edit_vendor_product_path
  end

  private

  def product_params
    params.permit(product:[:id, :name, :vendor_id])
  end


end
