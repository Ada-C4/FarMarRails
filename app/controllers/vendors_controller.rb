require 'pry'

class VendorsController < ApplicationController
  def index
    # if request.fullpath == "/vendors"
    #   @sign_in = "Vendor"
    # else
    id = params[:market_id]
    @market = Market.find(id)
    @@sign_in = "Market"
    # end
  end

  def show
    @@sign_in = "Vendor"
    id = params[:market_id]
    @market = Market.find(id)
  end

  def new
    @vendor = Vendor.new()
    @action = "create"
  end

  def create
    id = params[:market_id]
    @market = Market.find(id)
    new_params = vendor_params[:vendor]
    new_params[:market_id] = @market.id
    Vendor.create(new_params)
    redirect_to "/markets/#{@market.id}/vendors"
  end

  def edit
    binding.pry
    if @@sign_in == "Vendor"

      vendor_id = params[:id]
      @vendor = Vendor.find(vendor_id)
    else
      binding.pry
    end
    @action = "update"
  end

  def update
    market_id = params[:market_id]
    vendor_id = params[:id]
    Vendor.update(vendor_id, vendor_params[:vendor])
    redirect_to "/markets/#{market_id}/vendors"
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
