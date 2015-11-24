class SessionsController < ApplicationController
  def new
    if vendor_logged_in?
      redirect_to vendor_path(session[:vendor_id])
    elsif market_logged_in?
      redirect_to markets_path
    end
  end

  def create
    if !params[:session].nil? && !params[:session][:vendor_id].nil?
      session[:vendor_id] = params[:session][:vendor_id]
      session[:vendor_name] = Vendor.find(params[:session][:vendor_id]).name
      redirect_to vendor_path(session[:vendor_id])
    else # elsif params[:action] == "create"
      session[:market] = true
      redirect_to markets_path
    end

  end

  def destroy
    if vendor_logged_in?
      session.delete(:vendor_id)
      session.delete(:vendor_name)
      @user = nil
    elsif market_logged_in?
      session.delete(:market)# remove market logged in
    end
    redirect_to root_path
  end
end
