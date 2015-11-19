class ProductsController < ApplicationController
  def index
    redirect_to vendor_path(params[:vendor_id])
  end

  def new
    @new_vendor_product = Product.new
  end

  def create
    Product.create(name: product_params[:product][:name], vendor_id: params[:vendor_id])
    redirect_to vendor_path(params[:vendor_id])
  end

  private

  def product_params
    params.permit(product:[:name])
  end

end
