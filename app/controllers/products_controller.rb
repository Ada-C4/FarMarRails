class ProductsController < ApplicationController
  def new
    @header = "Add A New Product"
    @product = Product.new
    @action = "create"
    @method = :post
  end
  def edit
    @header = "Edit Product"
    id = params[:id]
    @product = Product.find(id)
    @action = "update"
    @method = :patch
    render "new"
  end
  def create
    id = params[:vendor_id]
    vendor = Vendor.find(id)
    vendor.products.create(product_params)
    redirect_to vendor_path(id)
  end
  def update
    id = params[:vendor_id]
    vendor = Vendor.find(id)
    
    redirect_to vendor_path(id)
  end
  def destroy
  end

  private
  def product_params
  params.require(:product).permit(:name, :vendor_id)
  end
end
