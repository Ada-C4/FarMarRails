class VendorsController < ApplicationController

  def vendors
    @vendors = Vendor.all
    render :index
  end

  def new
    @new_vendor = Vendor.new
  end

  def create
    a = Vendor.create(vendor_params[:vendor])
    redirect_to vendor_path(a.id)
  end

  def show
    @is_a_vendor = true
    id = params[:id]
    @vendor = Vendor.find(id)
    @products = @vendor.products
    @sales = @vendor.sales
    @total_sales = total_sales(@sales)
    @sales_this_month = @sales.find_all { |sale| sale.purchase_time.month == Time.now.month && sale.purchase_time.year == Time.now.year }
    @total_sales_this_month = total_sales(@sales_this_month)
  end

  def total_sales(sales)
    total_sales = 0
    sales.each do |sale|
      total_sales += sale.amount
    end
    return total_sales/100
  end


  def edit
    id = params[:id]
    @vendor = Vendor.find(id)
  end

  def update
    Vendor.update(params[:id], vendor_params[:vendor])
    redirect_to market_path(vendor_params[:vendor][:market_id])
  end

  def destroy
    Vendor.destroy(params[:id])
    redirect_to market_path(params[:market_id])
  end

  private

  def vendor_params
    params.permit(vendor:[:name, :employees, :market_id])
  end

end
