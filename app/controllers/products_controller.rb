class ProductsController < ApplicationController
  def new
    @header = "Add A New Product"
    @product = Product.new
    @action = "create"
    @method = :post
  end
  def edit
  end
  def create
    # Product.create(market_params[:product])
    # redirect_to
  end
  def update
  end
  def destroy
  end
end
