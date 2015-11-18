require 'pry'

class VendorsController < ApplicationController
  def index
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
    binding.pry
    Vendor.create(new_params)
    redirect_to "/markets/#{@market.id}/vendors"
  end

  private

  def vendor_params
    params.permit(vendor:[:name, :num_employees, :market_id])
  end
end
