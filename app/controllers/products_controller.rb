class ProductsController < ApplicationController
  def new
    @product = Product.new
    @vendor = Vendor.find(params[:vendor_id])
  end

  def create
    product = Product.create(product_params) do |p|
      p.vendor = Vendor.find(params[:vendor_id])
    end
    redirect_to product.vendor
  end

  def edit
    @product = Product.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to product.vendor
  end

  def destroy
    product = Product.destroy(params[:id])
    redirect_to product.vendor
  end

  private

  def product_params
    params.require(:product).permit(:name)
  end
end
