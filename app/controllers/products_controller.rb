class ProductsController < ApplicationController
  def new
    @product = Product.new
    @action = "create"
  end

  def create
    Product.create(product_params)

    vendor_id = params[:vendor_id]
    redirect_to vendor_path(vendor_id)
  end

  def show
    @product = Product.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])
  end

  ####################
  private

  def product_params
    product = params.require(:product).permit(:name)
    product.merge(params.permit(:vendor_id))
  end
end
