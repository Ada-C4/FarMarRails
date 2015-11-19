class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    product = Product.create(product_params[:product])
    redirect_to "/vendors/#{product.vendor_id}"
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def product_params
    params.permit(product: [:name])
  end
end
