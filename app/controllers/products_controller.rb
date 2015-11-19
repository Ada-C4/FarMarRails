class ProductsController < ApplicationController

  def create
    @product = Product.create
    redirect_to
  end

end
