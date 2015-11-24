class VendorsController < ApplicationController
  before_action :get_vendor, only: [:edit, :update]

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    Vendor.create(vendor_params[:vendor])
    redirect_to "/vendors"
  end

  def edit
  end

  def show
    id = params[:id]
    if session[:vendor_id] != id
      render 'vendors/error'
    else
      @vendor = Vendor.find(id)
      @products = @vendor.products
      @sales = @vendor.sales
    end
  end

  def update
    @vendor.update(
      name: vendor_params[:vendor][:name],
      no_employees: vendor_params[:vendor][:no_employees],
      market_id: vendor_params[:vendor][:market_id]
      )
    redirect_to vendor_path(session[:vendor_id])
  end

  def destroy
    id = params[:id]
    Vendor.destroy(id)
    redirect_to "/vendors"
  end

  private

  def get_vendor
    id = params[:id]
    @vendor = Vendor.find(id)
  end

  def vendor_params
    params.permit(vendor:[:id, :name, :no_employees, :market_id])
  end

end
