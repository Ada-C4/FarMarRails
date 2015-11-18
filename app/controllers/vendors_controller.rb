class VendorsController < ApplicationController
	def index
	  @vendors = Vendor.all
	end

	def new
	  id = params[:id]
	  @vendor = Vendor.find(id)
	end

	def create
	  Vendor.create(task_params[:vendor])
	end

	def edit
	  id = params[:id]
	  Vendor.delete(id)
	  redirect_to "/"
	end

	def destroy
	  id = params[:id]
	  Vendor.delete(id)
	  redirect_to "/"
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
