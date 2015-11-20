class VendorsController < ApplicationController
  before_action :get_vendor, only: [:edit, :show, :update]

  def get_vendor
    @vendor = Vendor.find(params[:id])
  end

  def create
    Vendor.create(name: vendor_params[:vendor][:name], num_employees: vendor_params[:vendor][:num_employees], market_id: params[:market_id])
    redirect_to market_path(params[:market_id])
  end

  def destroy
    Vendor.find(params[:id]).destroy
    redirect_to market_path(params[:market_id])
  end

  def edit

  end

  def index
    vendors = Vendor.all
    @vendors = vendors.order(:name)
    if request.path_info.include?('markets')
      id = params[:market_id]
      redirect_to market_path(id)
    end
  end

  def new
    id = params[:market_id]
    @market = Market.find(id)
    @new_market_vendor = Vendor.new
  end


  def show
    @products = @vendor.products

    if request.path_info.include?('home')
      render :home_vendor
    elsif request.path_info.include?('markets')
      render :market_vendor
    else
      render :show
    end
  end

  def update
    @vendor.update(vendor_params[:vendor])
    redirect_to market_path(@vendor.market)
  end

  private

  def vendor_params
    params.permit(vendor:[:name, :num_employees])
  end

end
