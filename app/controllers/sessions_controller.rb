class SessionsController < ApplicationController
  def new
    if !session[:vendor_id].nil?
      redirect_to vendor_path(session[:vendor_id])
    end
  end

  def create
    session[:vendor_id] = params[:session][:vendor_id]
    session[:vendor_name] = Vendor.find(params[:session][:vendor_id]).name
    redirect_to vendor_path(session[:vendor_id])
  end

  def destroy
    session.delete(:vendor_id)
    @user = nil
    redirect_to root_path
  end
end
