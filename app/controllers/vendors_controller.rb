require 'pry'

class VendorsController < ApplicationController
  def index
    # if request.fullpath == "/vendors"
    #   @sign_in = "Vendor"
    # else
    id = params[:market_id]
    @market = Market.find(id)
    @@sign_in = "Vendor"
    # end
  end

  def show
    @@sign_in = "Market"
    id = params[:market_id]
    @market = Market.find(id)
  end

  def new
    binding.pry
    @vendor = Vendor.new()
    if @@sign_in == "Market"
      id = params[:market_id]
      @market = Market.find(id)
      @action = "market_vendor_create"
    else
      @action = "create"
    end
  end

  def market_vendor_create
    id = params[:market_id]
    new_params = vendor_params[:vendor]
    new_params[:market_id] = id
    Vendor.create(new_params)
    redirect_to "/markets/#{id}/vendors"
  end

  def create
    new_params = vendor_params[:vendor]
    # NEED TO ADD PLACE IN FORM FOR MARKET
    new_params[:market_id] = 3
    Vendor.create(new_params)
    redirect_to "/vendors"
  end


  def edit
    if @@sign_in == "Market"
      id = params[:market_id]
      vendor_id = params[:id]
      @market = Market.find(id)
      @vendor = Vendor.find(vendor_id)
      @action = "market_vendor_update"
    else
      vendor_id = params[:id]
      @vendor = Vendor.find(vendor_id)
      @action = "update"
    end
  end

  def market_vendor_update
    market_id = params[:market_id]
    vendor_id = params[:id]
    Vendor.update(vendor_id, vendor_params[:vendor])
    redirect_to "/markets/#{market_id}/vendors"
  end

  def update
    #market_id = params[:market_id]
    vendor_id = params[:id]
    Vendor.update(vendor_id, vendor_params[:vendor])
    redirect_to "/vendors"
  end

  def destroy
    market_id = params[:market_id]
    Vendor.destroy(params[:id])
    redirect_to "/markets/#{market_id}/vendors"
  end

  private

  def vendor_params
    params.permit(vendor:[:name, :num_employees, :market_id])
  end
end
