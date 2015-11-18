class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    if request.path_info.include?('markets')
      render :market_vendor
    else
      render :show
    end
  end

end
