class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end
  def show
    id = params[:id]
    @vendor = Vendor.find(id)
  end
  def create
  end
  def new
  end
  def edit
  end
  def update
  end
  def destroy
  end
end
