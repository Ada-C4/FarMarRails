class VendorsController < ApplicationController
  def new
    @vendor = Vendor.new
  end
end
