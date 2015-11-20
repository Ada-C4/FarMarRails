class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to v_home_path(@product.vendor_id)
  end

  private

  def product_params
    params.require(:product).permit(:name, :vendor_id)
  end

end
