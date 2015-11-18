class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    id = params[:id]
    @products = Product.find(id)
  end

  def create
    Product.create(task_params[:product])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    id = params[:id]
    Product.delete(id)
    redirect_to "/"
  end

  def update
    id = params[:id]
    product = Product.find(id)
    product.update(
    name: product_params[:product][:name],
    vendor_id: product_params[:product][:vendor_id],
    )
  end

  private

  def product_params
    params.permit(product:[:name, :vendor_id])
  end

end
