class ProductsController < ApplicationController
  def new
    @product = Product.new
    @vendor = Vendor.find(params[:vendor_id])
  end

  def create
    product = Product.create(product_params[:product]) do |p|
      p.vendor = Vendor.find(params[:vendor_id])
    end
    redirect_to product.vendor
  end

private

  def product_params
    params.permit(product:[:name])
  end

end
