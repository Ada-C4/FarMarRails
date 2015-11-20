module SessionsHelper
  def vendor_logged_in?
    !session[:vendor_id].nil?
  end

  def market_logged_in?
    !session[:market].nil?
  end

end
