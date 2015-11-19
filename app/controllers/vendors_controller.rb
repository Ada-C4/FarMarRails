class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end
  def show
    id = params[:id]
    @vendor = Vendor.find(id)
  end

  def create
    Vendor.create(vendor_params[:vendor])
    redirect_to '/'
  end
  
  def new
    @vendor = Vendor.new
    @action = "create"
    @method = :post
    @title = "Vendor Information"
  end
  def edit
    @title = "Edit Vendor"
    id = params[:id]
    @action = "update"
    @method = :patch
    @vendor = Vendor.find(id)
    render "new"
  end

  def update
    Vendor.update(params[:id], vendor_params[:vendor])
    redirect_to '/'
  end
  def destroy
    id = params[:id]
    @vendor =Vendor.find(id).destroy
    redirect_to '/'
  end

private
  def vendor_params
    #this makes strong params
    params.permit(vendor:[:name, :employees, :market_id])
  end
end
