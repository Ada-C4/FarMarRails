class WelcomeController < ApplicationController
  def index
    @markets = Market.all
    @vendors = Vendor.all
  end

  def select
    if !params[:market].nil? && !params[:market][:id].empty?
      redirect_to market_path(params[:market][:id])
    elsif !params[:vendor].nil? && !params[:vendor][:id].empty?
      redirect_to vendor_path(params[:vendor][:id])
    else
      redirect_to root_path
    end
  end



end
