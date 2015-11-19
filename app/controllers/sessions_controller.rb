class SessionsController < ApplicationController
  def new
  end

  def create
    session[:vendor_id] = params[:session][:vendor_id]
    redirect_to vendor_path(session[:vendor_id])
  end

  def destroy
    session.delete(:vendor_id)
    redirect_to root_path
  end
end
