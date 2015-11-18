class VendorsController < ApplicationController
  def index
      #conditional
  end

  def show
    if request.path_info.include? '/market/'?
      render market_vendor
    else
      render vendor
    end
  end
end
