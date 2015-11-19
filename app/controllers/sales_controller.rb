class SalesController < ApplicationController
  def index
    vendor_id = params[:vendor_id]
    @sales = Sale.where(vendor_id: vendor_id)
  end
end
