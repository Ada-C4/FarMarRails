class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @market = Market.find(@vendor.market_id)
  end

  def new
    @vendor = Vendor.new
  end

  def create
    vendor = Vendor.create(vendor_params[:vendor])
    redirect_to "/vendors/#{vendor.id}"
  end

  def edit
    @vendor = Vendor.find(params[:id])
    name = params[:name]
    employee_no = params[:employee_no]
    market_id = params[:market_id]
  end

  def update
    @vendor = Vendor.find(params[:id])
    Vendor.update(params[:id], vendor_params[:vendor])
    redirect_to "/vendors/#{@vendor.id}"
  end

  def destroy
    Vendor.destroy(params[:id])
    redirect_to "/vendors/"
  end

  private

  def vendor_params
    params.permit(vendor: [:name, :employee_no, :market_id])
  end

end
