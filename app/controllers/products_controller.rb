class ProductsController < ApplicationController
  def index
    @title = "Products"
    @vendor_id = params[:vendor_id]
    @products = Product.where(vendor_id: @vendor_id)
  end

  def new
    @title = "Product Info"
    @vendor_id = params[:vendor_id]
    @product = Product.new()
    @action = "create"
  end

  def create
    @vendor_id = params[:vendor_id]
    new_params = product_params[:product]
    new_params[:vendor_id] = @vendor_id
    Product.create(new_params)
    redirect_to "/vendors/#{@vendor_id}/products"
  end

  def edit
    id = params[:id]
    @product = Product.find(id)
    @action = "update"
    @title = "Product Info"
  end

  def update
    @vendor_id = params[:vendor_id]
    id = params[:id]
    Product.update(id, product_params[:product])
    redirect_to "/vendors/#{@vendor_id}/products"
  end

  def destroy
    @vendor_id = params[:vendor_id]
    product_id = params[:id]
    Product.destroy(product_id)
    redirect_to "/vendors/#{@vendor_id}/products"
  end

  private

  def product_params
    params.permit(product:[:name, :vendor_id])
  end
end
