class SalesController < ApplicationController

  def index
    vendor_id = params[:id]
    @sales = Sale.where(vendor_id: vendor_id)
  end

  def new
  end

  def create
  end

  def month
  end

  private

  def sale_params
    params.permit(sale:[:vendor_id])
  end

end
