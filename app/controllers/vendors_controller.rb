class VendorsController < ApplicationController
  def index
    @market = Market.find(params[:market_id])
  end

  def show
    if params[:product_select].present?
      redirect_to(vendor_product_path(params[:id], params[:product_select]))
    end
    @vendor = Vendor.find(params[:id])
    @market = Market.find(params[:market_id]) if params[:market_id].present?
  end

  def new
    @vendor = Vendor.new
    @action = "create"
  end

  def create
    Vendor.create(vendor_params)

    market_id = params[:market_id]
    redirect_to market_path(market_id)
  end

  def edit
    id = params[:id]
    @vendor = Vendor.find(id)
    @action = "update"

    render :new
  end

  def update
    if params[:market_id].present?
      redirect_to market_path(params[:market_id])
    else
      updated_vendor = Vendor.update(params[:id], vendor_params)
      redirect_to vendor_path(updated_vendor)
    end
  end

  def destroy
    Vendor.destroy(params[:id])
    market_id = params[:market_id]
    redirect_to market_path(market_id)
  end

####################
  private

  def vendor_params
    vendor = params.require(:vendor).permit(:name, :employees)
    vendor.merge(params.permit(:market_id))
  end

end
