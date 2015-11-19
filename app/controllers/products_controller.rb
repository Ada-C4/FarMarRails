class ProductsController < ApplicationController
  def index
    vendor_id = params[:vendor_id]
    @products = Product.where(vendor_id: vendor_id)
  end
end
