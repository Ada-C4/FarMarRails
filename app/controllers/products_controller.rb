class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new(vendor_id: params[:vendor_id])
    session[:return_to] = request.referrer
  end

  def create
    product = Product.create(product_params)
    redirect_to session[:return_to]
  end

  def edit
    @product = Product.find(params[:id])
    session[:return_to] = request.referrer
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
    product = Product.find(id)
    product.update(
    name: product_params[:name],
    vendor_id: product_params[:vendor_id],
    )
    redirect_to session[:return_to]
  end

  private

  def product_params
    product = params.require(:product).permit(:name)
    product.merge(params.permit(:vendor_id))
  end

end
