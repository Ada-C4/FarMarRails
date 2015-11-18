class VendorsController < ApplicationController
	def index
	  @vendors = Market.find(params[:market_id]).vendors
	end

	def all
		@vendors = Vendor.all
	end

	def new
	  @vendor = Vendor.new
	end

	def create
	  Vendor.create(vendor_params[:vendor])
	end

	def edit
		@vendor = Vendor.find(params[:id])
	end

	def show
		@vendor = Vendor.find(params[:id])
	end

	def destroy
	  market_id = Vendor.find(params[:id]).market_id
	  Vendor.delete(params[:id])
	  redirect_to market_path(id: market_id)
	end

	def update
	  id = params[:id]
	  vendor = Vendor.find(id)
	  vendor.update(
	  name: vendor_params[:vendor][:name],
	  num_emps: vendor_params[:vendor][:num_emps],
	  market_id: vendor_params[:vendor][:market_id],
	  )
	end

	private

	def vendor_params
	  params.permit(vendor:[:name, :num_emps, :market_id])
	end
end
