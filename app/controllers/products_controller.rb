class ProductsController < ApplicationController
  before_action :get_product, only: [:update, :show, :edit]

  def index
    vendor_id = params[:vendor_id]
    @products = Vendor.find(vendor_id).products
  end

  def new
    @product = Product.new
    @url_path = vendor_products_path
  end

  def create
    vendor_id = params[:vendor_id]
    Product.create(
      name: product_params[:product][:name],
      vendor_id: session[:vendor_id])
    redirect_to vendor_products_path(vendor_id)
  end

  def edit
    @url_path = vendor_product_path
  end

  def show
  end

  def update
    vendor_id = params[:vendor_id]
    @product.update(
      name: product_params[:product][:name],
      vendor_id: vendor_id
      )
    redirect_to vendor_product_path(vendor_id, id)
  end

  def destroy
    id = params[:id]
    vendor_id = params[:vendor_id]
    Product.destroy(id)
    sales = Sale.where('product_id = ?', id)
    sales.each { |sale| sale.destroy }
    redirect_to vendor_products_path(vendor_id)
  end

  private
  def get_product
    id = params[:id]
    @product = Product.find(id)
  end

  def product_params
    params.permit(product:[:name])
  end

end
