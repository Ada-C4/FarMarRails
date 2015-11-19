class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new(vendor_id: params[:id])
    session[:return_to] = request.referrer
  end

  def create
    product = Product.create(product_params[:product])
    redirect_to session[:return_to]
  end

  def edit
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    id = params[:id]
    vendor_id = Product.find(params[:id]).vendor_id
    market_id = Vendor.find(vendor_id).market_id
    Product.delete(id)
    redirect_to market_vendor_path(market_id: market_id , id: vendor_id)
  end

  def update
    id = params[:id]
    vendor_id = Product.find(params[:id]).vendor_id
    market_id = Vendor.find(vendor_id).market_id
    product = Product.find(id)
    product.update(
    name: product_params[:product][:name],
    vendor_id: product_params[:product][:vendor_id],
    )
    redirect_to market_vendor_path(market_id: market_id , id: vendor_id)
  end

  private

  def product_params
    params.permit(product:[:name, :vendor_id])
  end

end
