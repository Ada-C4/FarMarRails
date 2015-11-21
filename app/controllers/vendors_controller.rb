class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end
  def show
    id = params[:id]
    @vendor = Vendor.find(id)
  end


  def create
    market = Market.find(params[:market_id])
    market.vendors.create(vendor_params)
    redirect_to market_path(params[:market_id])
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
    Vendor.update(params[:id], vendor_params)
    redirect_to market_path(params[:market_id])
  end

  def destroy
    id = params[:id]
    @vendor =Vendor.find(id).destroy
    redirect_to market_path(params[:market_id])
  end

private
  def vendor_params
    #this makes strong params
    params.require(:vendor).permit(:name, :employees)
  end
end
