class ProductsController < ApplicationController

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to vendor_path(@product.vendor_id)
  end

  def destroy
    p = Product.find(params[:id])
    v_id = p.vendor_id
    p.destroy
    redirect_to vendor_path(v_id)
  end

  private

  def product_params
    params.require(:product).permit(:name, :vendor_id)
  end

end
