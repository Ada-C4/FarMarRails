class VendorsController < ApplicationController

  def create
    Vendor.create(name: vendor_params[:vendor][:name], num_employees: vendor_params[:vendor][:num_employees], market_id: params[:market_id])
    redirect_to market_path(params[:market_id])
  end

  def destroy
    Vendor.find(params[:id]).destroy
    redirect_to market_path(params[:market_id])
  end

  def edit
    id = params[:id]
    @vendor = Vendor.find(id)
  end

  def index
    vendors = Vendor.all
    @vendors = vendors.order(:name)
  end

  def new
    id = params[:market_id]
    @market = Market.find(id)
    @new_market_vendor = Vendor.new
  end


  def show
    id = params[:id]
    @vendor = Vendor.find(id)
    @products = @vendor.products

    if request.path_info.include?('markets')
      render :market_vendor
    elsif request.path_info.include?('home')
      render :home_vendor
    else
      render :show
    end
  end

  def update
    id = params[:id]
    @vendor = Vendor.find(id)
    @vendor.update(vendor_params[:vendor])
    redirect_to market_path(@vendor.market)
  end

  private

  def vendor_params
    params.permit(vendor:[:name, :num_employees])
  end

end
