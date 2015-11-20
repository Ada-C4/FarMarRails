class VendorsController < ApplicationController
	def index
		session[:user_type] = params[:user_type]
	  @vendors = Market.find(params[:market_id]).vendors
		@vendors.sort_by! {|vendor| vendor[:name]}
	end

	def all
		@vendors = Vendor.all
		@vendors.sort! { |vendor| vendor.name }
	end

	def new
	  @vendor = Vendor.new
	end

	def create
	  vendor = Vendor.create(vendor_params[:vendor])
	  vendor.market_id = params[:market_id]
	  vendor.save
	  @buttons = true
	  redirect_to market_path(id: vendor.market_id)
	end

	def edit
		@vendor = Vendor.find(params[:id])
	end

	def show
		@vendor = Vendor.find(params[:id])
		@sales = []
		@vendor.products.each do |product|
			product.sales.each do |sale|
				@sales << sale
			end
		end
		@sales = @sales if params[:order].nil?
		# if params[:order] == 'desc'
		# 	sales = @sales.sort_by { |sale| sale[:amount] }
		# 	@sales = sales.reverse
		# end
		@sales.sort_by! { |sale| sale[:amount] }.reverse! if params[:order] == 'desc'
		@sales.sort_by! { |sale| sale[:amount] } if params[:order] == 'asc'
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
	  num_emps: vendor_params[:vendor][:num_emps]
	  )
	  @buttons = true
	  redirect_to market_path(id: vendor.market_id)
	end

	private

	def vendor_params
	  params.permit(vendor:[:name, :num_emps, :market_id])
	end
end
