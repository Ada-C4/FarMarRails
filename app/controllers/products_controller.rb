class ProductsController < ApplicationController
  def index
    @vendor_id = params[:vendor_id]
    @products = Product.where(vendor_id: @vendor_id)
  end

  def destroy
    @vendor_id = params[:vendor_id]
    product_id = params[:id]
    Product.destroy(product_id)
    redirect_to "/vendors/#{@vendor_id}/products"
  end
end
