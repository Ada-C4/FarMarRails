class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end

  def create
    vendor = Vendor.create(vendor_params[:vendor])
    redirect_to "/vendors/#{vendor.id}"
  end

  # def edit
  #   @vendor = Vendor.find(params[:id])
  #
  # end
  #
  # def update
  #
  # end

  def destroy
    Vendor.destroy(params[:id])
    redirect_to "/vendors/"
  end

  private

  def vendor_params
    params.permit(vendor: [:name, :employee_no, :market_id])
  end

end
